

function varargout = proje_gui_kucuk(varargin)


gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @proje_gui_kucuk_OpeningFcn, ...
                   'gui_OutputFcn',  @proje_gui_kucuk_OutputFcn, ...
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


% --- Executes just before proje_gui_kucuk is made visible.
function proje_gui_kucuk_OpeningFcn(hObject, eventdata, handles, varargin)
load('C:\Users\hcyil\Desktop\kucuk_harfler_workspace.mat')

% Choose default command line output for proje_gui_kucuk
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes proje_gui_kucuk wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = proje_gui_kucuk_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
load kucuk_harfler_workspace.mat

global image;
[filename, pathname] = uigetfile();
if filename==0
    msgbox(sprintf('resim yukle'),'HATA','ERROR');
end
axes(handles.axes1)
image=imread(filename);
imshow(image);
O=dct2(image);
O1=O(1:10,1:10);
O11=O1(:);
K=sim(net_k,O11);

%set(handles.edit1,'String',O11);
set (handles.edit1, 'Min' , 0, 'Max' , 29,'String',K);




function edit1_Callback(hObject, eventdata, handles)





% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
