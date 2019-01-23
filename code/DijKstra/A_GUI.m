function varargout = A_GUI(varargin)
% A_GUI MATLAB code for A_GUI.fig
%      A_GUI, by itself, creates a new A_GUI or raises the existing
%      singleton*.
%
%      H = A_GUI returns the handle to a new A_GUI or the handle to
%      the existing singleton*.
%
%      A_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in A_GUI.M with the given input arguments.
%
%      A_GUI('Property','Value',...) creates a new A_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before A_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to A_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help A_GUI

% Last Modified by GUIDE v2.5 21-Oct-2018 17:10:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @A_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @A_GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before A_GUI is made visible.
function A_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to A_GUI (see VARARGIN)

% Choose default command line output for A_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes A_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = A_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% set up color map for display ���ɲ�ɫ��ͼ 
global cmap;
global map;
global n_r;
global n_c;
global state;

cmap = [1 1 1; ...% 1 -��ɫ-���ϰ�
        0 0 0; ...% 2 -��ɫ-���ϰ�
        0 0.8 0; ...% 3 -��ɫ-������
        0 0.4 0; ...% 4 -��ɫ-��������
        0 1 1; ...% 5 -ǳ��ɫ-��ʼ��
        1 1 0; ...% 6 -��ɫ-Ŀ���
        0 0 1];   % 7 -��ɫ-����·��
colormap(cmap); 
%���������ͼ
map = zeros(n_r,n_c);
randmap = rand(n_r,n_c);
for i = 2:(sub2ind(size(randmap),n_r,n_c)-1)
    if (randmap(i) >= 0.75)
        map(i) = 2;
    end
end

map(1, 1) = 5; % start_coords �������
map(n_r, n_c) = 6; % dest_coords �յ�����
image(1.5,1.5,map); 
grid on; 
axis image; 
set(handles.text5,'string','�����ͼ�������');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%�������·��
global n_r;
global n_c;
global cmap;
global map;
global state;

nrows = n_r; 
ncols = n_c; 
start_node = sub2ind(size(map), 1, 1); 
%sub2ind()�����������е�ĳ��Ԫ�ص�������ż������
%�������������ӣ�2*2����[1 3;�У�1�ǵ�һ����5�ǵڶ���
%                       5 7]  ��3�ǵ�������7�ǵ��ĸ�
%��matlab�������ȣ���������ͨ��ϰ�ߵ������ȣ�
dest_node = sub2ind(size(map), n_r, n_c); 
% Initialize distance array ��ʼ����������
distanceFromStart = Inf(nrows,ncols); 
distanceFromStart(start_node) = 0 ;
% For each grid cell this array holds the index of its parent ����ÿ������Ԫ�������鶼�����丸��Ԫ������
parent = zeros(nrows,ncols); 
 % Main Loop 
while true 
  % Draw current map 
  map(start_node) = 5; 
  map(dest_node) = 6; 
  image(1.5, 1.5, map); 
  grid on; %����
  axis image; %��ʾ����
  drawnow; %ˢ����Ļ
  % Find the node with the minimum distance �ҵ�������̵Ľڵ�
  [min_dist, current] = min(distanceFromStart(:));
  if ((current == dest_node) || isinf(min_dist)) %TF = isinf(A) ������һ����A�ߴ�һ�������飬 ���A��ĳ��Ԫ����inf  (����)�� ���ӦTF��Ԫ����1�� ����TF�ж�ӦԪ����0�� 
       break; 
  end; 
  %�������ĵ��������꣺current,
  %������������ʼ���·�̣�min_dist
  % ������ֵ������á�
 
  map(current) = 3; 
  distanceFromStart(current) = Inf; 
  [i, j] = ind2sub(size(distanceFromStart), current); %�����ű�Ϊ����
  neighbor = [i-1,j; 
              i+1,j; 
              i,j+1; 
              i,j-1]; 
    outRangetest = (neighbor(:,1)<1) + (neighbor(:,1)>nrows)+(neighbor(:,2)<1) + (neighbor(:,2)>ncols); 
    locate = find(outRangetest>0);  %����outRangetest�д���0��Ԫ�ص����Ӧ����������ֵ��
    neighbor(locate,:)=[]; 
    neighborIndex = sub2ind(size(map),neighbor(:,1),neighbor(:,2));
for i=1:length(neighborIndex) 
 if (map(neighborIndex(i))~=2) && (map(neighborIndex(i))~=3 && map(neighborIndex(i))~= 5) 
     map(neighborIndex(i)) = 4; 
   if (distanceFromStart(neighborIndex(i))>= min_dist + 1 )     
       distanceFromStart(neighborIndex(i)) = min_dist+1;
         parent(neighborIndex(i)) = current;   
        % pause(0.02); 
   end 
  end 
 end 
 end
% %%
 if (isinf(distanceFromStart(dest_node))) 
     %route = [];
     disp('·������ʧ��');
     set(handles.text5,'string','·������ʧ��');
 else 
     %��ȡ·������
     set(handles.text5,'string','·�������ɹ�');

     route = [dest_node];
       while (parent(route(1)) ~= 0) 
               route(1);
               parent(route(1))
               route = [parent(route(1)), route] ;
        end 
   % ��̬��ʾ��·��     
         for k = 2:length(route) - 1 
           map(route(k)) = 7; 
                 pause(0.02); 
                 image(1.5, 1.5, map); 
               grid on; 
               axis image; 
         end 
     disp('·�������ɹ�');
 end
 

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
row = [15 20 25 300];
global n_r
n_r = row(get(handles.popupmenu1, 'value'));
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
col = [15 20 25 300];
global n_c
n_c = col(get(handles.popupmenu2, 'value'));

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function text5_Callback(hObject, eventdata, handles)
% hObject    handle to text5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text5 as text
%        str2double(get(hObject,'String')) returns contents of text5 as a double
