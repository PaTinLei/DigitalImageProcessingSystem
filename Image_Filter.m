function varargout = Image_Filter(varargin)
% IMAGE_FILTER MATLAB code for Image_Filter.fig
%      IMAGE_FILTER, by itself, creates a new IMAGE_FILTER or raises the existing
%      singleton*.
%
%      H = IMAGE_FILTER returns the handle to a new IMAGE_FILTER or the handle to
%      the existing singleton*.
%
%      IMAGE_FILTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGE_FILTER.M with the given input arguments.
%
%      IMAGE_FILTER('Property','Value',...) creates a new IMAGE_FILTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Image_Filter_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Image_Filter_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Image_Filter

% Last Modified by GUIDE v2.5 20-Oct-2018 21:53:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Image_Filter_OpeningFcn, ...
                   'gui_OutputFcn',  @Image_Filter_OutputFcn, ...
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


% --- Executes just before Image_Filter is made visible.
function Image_Filter_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Image_Filter (see VARARGIN)

% Choose default command line output for Image_Filter
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Image_Filter wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Image_Filter_OutputFcn(hObject, eventdata, handles) 
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
% handles    structure with handles and user data (see GUIDATA
global Image_Original;
global Image_Gray;
global Latest_Image;

[filename,pathname]=uigetfile('*.*','��ͼ��'); 
filepath=[pathname filename];
Image_Original=imread(filepath); 

if numel(size(Image_Original))>2%�ж��Ƿ�Ϊ��ɫͼ��
	Image_Gray = rgb2gray(Image_Original); %����ɫͼ��ת��Ϊ�Ҷ�ͼ��
else
	Image_Gray = Image_Original;
end
Latest_Image = Image_Gray;%��������ͼ������ͼƬ���湦��

axes(handles.axes1);%��ȡ��������
imshow(Image_Gray);
title('ԭͼ��Ҷ�ͼ');



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Latest_Image;
imwrite(Latest_Image,'ͼƬ.jpg'); 
%imwrite(Latest_Image,['fig',num2str(100),'jpg']);%�Զ�����

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(Image_Filter);%�رմ���


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image_Original;%�ٴ�����ȫ�ֱ���
global Image_Gray;
global Latest_Image;

if get(handles.radiobutton8,'value')
    radio_button = 8;
elseif get(handles.radiobutton9,'value')
    radio_button = 9;
elseif get(handles.radiobutton10,'value')
    radio_button = 10;
elseif get(handles.radiobutton11,'value')
    radio_button = 11;
elseif get(handles.radiobutton12,'value')
    radio_button = 12;
elseif get(handles.radiobutton13,'value')
    radio_button = 13;
elseif get(handles.radiobutton14,'value')
    radio_button = 14;
end
switch (radio_button)
    case 8%ȡ��ͼ��
        Inverse_Image = imcomplement(Image_Gray);
        Latest_Image = Inverse_Image;%��������ͼ������ͼƬ���湦��
        axes(handles.axes2);%��ȡ��������
        imshow(Inverse_Image);
        title('�Ҷ�ͼȡ��ͼ��');
    case 9%ֱ��ͼͼ��
        Color_Image(:,:,1)=255-Image_Original(:,:,1);
        Color_Image(:,:,2)=255-Image_Original(:,:,2);
        Color_Image(:,:,3)=255-Image_Original(:,:,3);
        Latest_Image = Color_Image;%��������ͼ������ͼƬ���湦��
        axes(handles.axes2);%��ȡ��������
        imshow(Color_Image);
        title('��ɫͼȡ��ͼ��');
    case 10%ֱ��ͼ��ֵ��
        Histeq_Image = histeq(Image_Gray,16);
        axes(handles.axes2);%��ȡ��������
        imshow(Histeq_Image);
        Latest_Image = Histeq_Image;%��������ͼ������ͼƬ���湦��
        title('�Ҷ�ͼֱ��ͼ���⻯');
    case 11%sobel������ͼ��
        Sobel_Image = edge(Image_Gray,'sobel'); %sobel������
        axes(handles.axes2);%��ȡ��������
        imshow(Sobel_Image);
        Latest_Image = Sobel_Image;%��������ͼ������ͼƬ���湦��
        title('sobel�����񻯻Ҷ�ͼ��');
    case 12%prewitt������ͼ��
        Prewitt_Image = edge(Image_Gray,'prewitt'); %roberts������
        axes(handles.axes2);%��ȡ��������
        imshow(Prewitt_Image);
        Latest_Image = Prewitt_Image;%��������ͼ������ͼƬ���湦��
        title('prewitt�����񻯻Ҷ�ͼ��');
    case 13%roberts������ͼ��
        Roberts_Image = edge(Image_Gray,'roberts'); %roberts������
        axes(handles.axes2);%��ȡ��������
        imshow(Roberts_Image);
        Latest_Image = Roberts_Image;%��������ͼ������ͼƬ���湦��
        title('roberts�����񻯻Ҷ�ͼ��');
    case 14%ֱ��ͼ
        global Latest_Image;
        axes(handles.axes3);%��ȡ��������
        imhist(Latest_Image); 
        title('ͼ��ֱ��ͼ');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image_Original;%�ٴ�����ȫ�ֱ���
global Image_Gray;
global Latest_Image;
global filter_enable;
global Noise_Image;

if get(handles.radiobutton5,'value')
    radio_button = 5;
elseif get(handles.radiobutton6,'value')
    radio_button = 6;
elseif get(handles.radiobutton7,'value')
    radio_button = 7;
end

switch radio_button
    case 5%��ֵ�˲�
         Median_Num = str2num(get(handles.edit6,'String'));%��ֵ
         if(filter_enable == 1)%�Ƿ�������������
              Median_Image = medfilt2(Latest_Image);%
         else%�Ҷ�ͼ����һ������
              Median_Image = medfilt2(Noise_Image);%
         end
         Latest_Image = Median_Image;%��������ͼ������ͼƬ���湦��
         axes(handles.axes3);%��ȡ��������
         imshow(Median_Image);
         title('��ֵ�˲�');
     case 6%ά���˲�
         
         Wiener_Num = str2num(get(handles.edit6,'String'));%��ֵ
         if(filter_enable == 1)%�Ƿ�������������
              Wiener_Image = wiener2(Latest_Image,[Wiener_Num,Wiener_Num]);
         else%�Ҷ�ͼ����һ������
              Wiener_Image = wiener2(Noise_Image,[Wiener_Num,Wiener_Num]);
         end
         Latest_Image = Wiener_Image;%��������ͼ������ͼƬ���湦��
         axes(handles.axes3);%��ȡ��������
         imshow(Wiener_Image);
         title('ά���˲�');
     case 7%��ֵ�˲�
         Medfilt_Num = str2num(get(handles.edit7,'String'));%
         if(filter_enable == 1)%�Ƿ�������������
              Medfilt_Image = medfilt2(Latest_Image,[Medfilt_Num,Medfilt_Num]);
         else%�Ҷ�ͼ����һ������
              Medfilt_Image = medfilt2(Noise_Image,[Medfilt_Num,Medfilt_Num]);
         end
         Latest_Image = Medfilt_Image;%��������ͼ������ͼƬ���湦��
         axes(handles.axes3);%��ȡ��������
         imshow(Medfilt_Image);
         title('�����˲�');
end

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Latest_Image;
axes(handles.axes2);%��ȡ��������
imhist(Latest_Image); 
title('ͼ��ֱ��ͼ');

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image_Original;%�ٴ�����ȫ�ֱ���
global Image_Gray;
global Latest_Image;
global noise_enable;
global Noise_Image;

if get(handles.radiobutton1,'value')
    radio_button = 1;
elseif get(handles.radiobutton2,'value')
    radio_button = 2;
elseif get(handles.radiobutton3,'value')
    radio_button = 3;
elseif get(handles.radiobutton4,'value')
    radio_button = 4;
end
switch radio_button
    case 1%��˹����
         Gaussian_Mean= str2num(get(handles.edit1,'String'));%��ֵ
         Gaussian_Var= str2num(get(handles.edit2,'String'));%����
         if(noise_enable == 1)%�Ƿ�������������
              Gaussian_Image = imnoise(Latest_Image,'gaussian',Gaussian_Mean,Gaussian_Var);%�����˹����
         else%�Ҷ�ͼ����һ������
              Gaussian_Image = imnoise(Image_Gray,'gaussian',Gaussian_Mean,Gaussian_Var);%�����˹����
         end
         Latest_Image = Gaussian_Image;%��������ͼ������ͼƬ���湦��
         axes(handles.axes2);%��ȡ��������
         imshow(Gaussian_Image);
         title('��˹����');
    case 2%��������
         Poisson_Probability= str2num(get(handles.edit3,'String'));%����
         if(noise_enable == 1)%�Ƿ�������������
              Poisson_Image = imnoise(Latest_Image,'poisson');%���벴������
         else%�Ҷ�ͼ����һ������
              Poisson_Image = imnoise(Image_Gray,'poisson');%���벴������
         end
         Latest_Image = Poisson_Image;%��������ͼ������ͼƬ���湦��
         axes(handles.axes2);%��ȡ��������
         imshow(Poisson_Image);
         title('��������');
    case 3%��������
         Salt_Density = str2num(get(handles.edit4,'String'));%��ֵ
         if(noise_enable == 1)%�Ƿ�������������
            Salt_Image = imnoise(Latest_Image,'salt & pepper',Salt_Density);%���뽷������
         else
             Salt_Image = imnoise(Image_Gray,'salt & pepper',Salt_Density);%���뽷������
         end
         Latest_Image = Salt_Image;%��������ͼ������ͼƬ���湦��
         axes(handles.axes2);%��ȡ��������
         imshow(Salt_Image);
         title('��������');
    case 4%��������
         Multiplicative_Var= str2num(get(handles.edit5,'String'));%����
         if(noise_enable == 1)%�Ƿ�������������
             Multiplicative_Image = imnoise(Latest_Image,'speckle',Multiplicative_Var);%�����������
         else
             Multiplicative_Image = imnoise(Image_Gray,'speckle',Multiplicative_Var);%�����������
         end
         Latest_Image = Multiplicative_Image;%��������ͼ������ͼƬ���湦��
         axes(handles.axes2);%��ȡ��������
         imshow(Multiplicative_Image);
         title('��������');
end
Noise_Image = Latest_Image;

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)\
global Latest_Image;
axes(handles.axes3);%��ȡ��������
imhist(Latest_Image); 
title('ͼ��ֱ��ͼ');

% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global noise_enable;
noise_enable = 0;
if ( get(hObject,'Value') )
    noise_enable = 1;
else
    noise_enable = 0;
end

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filter_enable;
filter_enable = 0;
if ( get(hObject,'Value') )
    filter_enable = 1;
else
    filter_enable = 0;
end

% Hint: get(hObject,'Value') returns toggle state of checkbox3
