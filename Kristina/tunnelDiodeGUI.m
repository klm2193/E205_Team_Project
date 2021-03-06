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

axes(handles.axes1);
title('Output Voltage vs. Time')
xlabel('t (ns)');
ylabel('Vout (V)');
grid on

axes(handles.axes2);
title('Bifurcation Plot of x_1^* (Vout) vs. Vin')
xlabel('Vin (V)');
ylabel('x_1^*');
axis(1*[0 2.5 0 1])

VinValues1 = importdata('VinValues1.mat');
x1Values1 = importdata('x1Values1.mat');
VinValues2 = importdata('VinValues2.mat');
x1Values2 = importdata('x1Values2.mat');
VinValues3 = importdata('VinValues3.mat');
x1Values3 = importdata('x1Values3.mat');

plot(VinValues1, x1Values1, 'mo', VinValues2, x1Values2, 'co',...
    VinValues3, x1Values3, 'bo')
grid on

axes(handles.axes3);
title('Input Voltage vs. Time')
xlabel('t (ns)');
ylabel('Vin (V)');
grid on

% Choose default command line output for vdpolgui_extras
handles.output = hObject;

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

% clear plots
cla;

% Update handles structure
guidata(hObject, handles);

% plot bifurcation plot
VinValues1 = importdata('VinValues1.mat');
x1Values1 = importdata('x1Values1.mat');
VinValues2 = importdata('VinValues2.mat');
x1Values2 = importdata('x1Values2.mat');
VinValues3 = importdata('VinValues3.mat');
x1Values3 = importdata('x1Values3.mat');
axes(handles.axes2);
plot(VinValues1, x1Values1, 'mo', VinValues2, x1Values2, 'co',...
    VinValues3, x1Values3, 'bo')
title('Bifurcation Plot of x_1^* (Vout) vs. Vin')
xlabel('Vin (V)');
ylabel('x_1^*');
axis(1*[0 2.5 0 1])
grid on

% get input parameters
R = 1.5; % kOhm
C = 2; % pF
L = 5; % uH
Vmax = get(handles.Vmax, 'String');
Vmax = str2double(Vmax);
tpulse = get(handles.tpulse, 'String');
tpulse = str2double(tpulse);

% send variables to workspace
assignin('base', 'Vmax', Vmax);
assignin('base', 'tpulse', tpulse);
assignin('base', 'R', R);
assignin('base', 'L', L);
assignin('base', 'C', C);

tspan = tpulse*1.5 + 20 * (tpulse < 20); % ns
t_output=[0:0.01:tspan];
[t, x, y] = sim('tunnelDiodeModel', t_output);

% plot Vout
axes(handles.axes1);
plot(t, y(:,1))
title('Output Voltage vs. Time')
xlabel('t (ns)');
ylabel('Vout (V)');
grid on

% plot Vin
axes(handles.axes3);
plot(t, y(:,3))
title('Input Voltage vs. Time')
xlabel('t (ns)');
ylabel('Vin (V)');
axis(1*[0 tspan 0 Vmax+0.1])
grid on


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
