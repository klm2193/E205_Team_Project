function varargout = tunnelDiodeGUI(varargin)
% TUNNELDIODEGUI MATLAB code for tunnelDiodeGUI.fig
%      TUNNELDIODEGUI, by itself, creates a new TUNNELDIODEGUI or raises the existing
%      singleton*.
%
%      H = TUNNELDIODEGUI returns the handle to a new TUNNELDIODEGUI or the handle to
%      the existing singleton*.
%
%      TUNNELDIODEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TUNNELDIODEGUI.M with the given input arguments.
%
%      TUNNELDIODEGUI('Property','Value',...) creates a new TUNNELDIODEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tunnelDiodeGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tunnelDiodeGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tunnelDiodeGUI

% Last Modified by GUIDE v2.5 01-Nov-2014 22:07:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tunnelDiodeGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @tunnelDiodeGUI_OutputFcn, ...
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


% --- Executes just before tunnelDiodeGUI is made visible.
function tunnelDiodeGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tunnelDiodeGUI (see VARARGIN)

% Choose default command line output for tunnelDiodeGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tunnelDiodeGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tunnelDiodeGUI_OutputFcn(hObject, eventdata, handles) 
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



function Vmax_Callback(hObject, eventdata, handles)
% hObject    handle to Vmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Vmax as text
%        str2double(get(hObject,'String')) returns contents of Vmax as a double


% --- Executes during object creation, after setting all properties.
function Vmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tpulse_Callback(hObject, eventdata, handles)
% hObject    handle to tpulse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tpulse as text
%        str2double(get(hObject,'String')) returns contents of tpulse as a double


% --- Executes during object creation, after setting all properties.
function tpulse_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tpulse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
