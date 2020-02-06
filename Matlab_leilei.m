function varargout = Matlab_leilei(varargin)
% MATLAB_LEILEI MATLAB code for Matlab_leilei.fig
%      MATLAB_LEILEI, by itself, creates a new MATLAB_LEILEI or raises the existing
%      singleton*.
%
%      H = MATLAB_LEILEI returns the handle to a new MATLAB_LEILEI or the handle to
%      the existing singleton*.
%
%      MATLAB_LEILEI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MATLAB_LEILEI.M with the given input arguments.
%
%      MATLAB_LEILEI('Property','Value',...) creates a new MATLAB_LEILEI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Matlab_leilei_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Matlab_leilei_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Matlab_leilei

% Last Modified by GUIDE v2.5 21-Oct-2018 07:31:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Matlab_leilei_OpeningFcn, ...
                   'gui_OutputFcn',  @Matlab_leilei_OutputFcn, ...
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


% --- Executes just before Matlab_leilei is made visible.
function Matlab_leilei_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Matlab_leilei (see VARARGIN)

% Choose default command line output for Matlab_leilei
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Matlab_leilei wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Matlab_leilei_OutputFcn(hObject, eventdata, handles) 
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
run('Signal_Display');

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('Image_Filter');

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('Digital_Signal_Processing');