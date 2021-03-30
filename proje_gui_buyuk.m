function varargout = proje_gui_buyuk(varargin)
% PROJE_GUI_BUYUK MATLAB code for proje_gui_buyuk.fig
%      PROJE_GUI_BUYUK, by itself, creates a new PROJE_GUI_BUYUK or raises the existing
%      singleton*.
%
%      H = PROJE_GUI_BUYUK returns the handle to a new PROJE_GUI_BUYUK or the handle to
%      the existing singleton*.
%
%      PROJE_GUI_BUYUK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJE_GUI_BUYUK.M with the given input arguments.
%
%      PROJE_GUI_BUYUK('Property','Value',...) creates a new PROJE_GUI_BUYUK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before proje_gui_buyuk_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to proje_gui_buyuk_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help proje_gui_buyuk

% Last Modified by GUIDE v2.5 30-Mar-2021 21:31:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @proje_gui_buyuk_OpeningFcn, ...
                   'gui_OutputFcn',  @proje_gui_buyuk_OutputFcn, ...
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


% --- Executes just before proje_gui_buyuk is made visible.
function proje_gui_buyuk_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to proje_gui_buyuk (see VARARGIN)

% Choose default command line output for proje_gui_buyuk
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes proje_gui_buyuk wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = proje_gui_buyuk_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
load buyuk_harfler_workspace.mat

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
K=sim(net_b,O11);

%set(handles.edit1,'String',O11);
set (handles.edit1, 'Min' , 0, 'Max' , 29,'String',K);
