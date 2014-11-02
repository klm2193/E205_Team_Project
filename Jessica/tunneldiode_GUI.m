function varargout = tunneldiode_GUI(varargin)
% TUNNELDIODE_GUI MATLAB code for tunneldiode_GUI.fig
%      TUNNELDIODE_GUI, by itself, creates a new TUNNELDIODE_GUI or raises the existing
%      singleton*.
%
%      H = TUNNELDIODE_GUI returns the handle to a new TUNNELDIODE_GUI or the handle to
%      the existing singleton*.
%
%      TUNNELDIODE_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TUNNELDIODE_GUI.M with the given input arguments.
%
%      TUNNELDIODE_GUI('Property','Value',...) creates a new TUNNELDIODE_GUI or raises
%      the existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tunneldiode_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tunneldiode_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tunneldiode_GUI

% Last Modified by GUIDE v2.5 01-Nov-2014 22:22:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tunneldiode_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @tunneldiode_GUI_OutputFcn, ...
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

% --- Executes just before tunneldiode_GUI is made visible.
function tunneldiode_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tunneldiode_GUI (see VARARGIN)

% Choose default command line output for tunneldiode_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

initialize_gui(hObject, handles, false);

% UIWAIT makes tunneldiode_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tunneldiode_GUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function tpulse_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tpulse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
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
tpulse = str2double(get(hObject, 'String'));
if isnan(tpulse)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new tpulse value
handles.metricdata.tpulse = tpulse;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function Vmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Vmax_Callback(hObject, eventdata, handles)
% hObject    handle to Vmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Vmax as text
%        str2double(get(hObject,'String')) returns contents of Vmax as a double
Vmax = str2double(get(hObject, 'String'));
if isnan(Vmax)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new Vmax value
handles.metricdata.Vmax = Vmax;
guidata(hObject,handles)

% --- Executes on button press in calculate.
function calculate_Callback(hObject, eventdata, handles)
% hObject    handle to calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% ARCHAIC FROM ORIGINAL TEMPLATE
% mass = handles.metricdata.tpulse * handles.metricdata.Vmax;
% set(handles.mass, 'String', mass);

% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

initialize_gui(gcbf, handles, true);

% --- Executes when selected object changed in unitgroup.
function unitgroup_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in unitgroup 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if (hObject == handles.english)
    set(handles.text4, 'String', 'lb/cu.in');
    set(handles.text5, 'String', 'cu.in');
    set(handles.text6, 'String', 'lb');
else
    set(handles.text4, 'String', 'kg/cu.m');
    set(handles.text5, 'String', 'cu.m');
    set(handles.text6, 'String', 'kg');
end

% --------------------------------------------------------------------
function initialize_gui(fig_handle, handles, isreset)
% If the metricdata field is present and the reset flag is false, it means
% we are we are just re-initializing a GUI by calling it from the cmd line
% while it is up. So, bail out as we dont want to reset the data.
if isfield(handles, 'metricdata') && ~isreset
    return;
end

handles.metricdata.tpulse = 0;
handles.metricdata.Vmax  = 0;

set(handles.tpulse, 'String', handles.metricdata.tpulse);
set(handles.Vmax,  'String', handles.metricdata.Vmax);
% set(handles.mass, 'String', 0);

set(handles.unitgroup, 'SelectedObject', handles.english);

% ORIGINAL TEMPLATE
% set(handles.text4, 'String', 'lb/cu.in');
% set(handles.text5, 'String', 'cu.in');
% set(handles.text6, 'String', 'lb');

% Update handles structure
guidata(handles.figure1, handles);