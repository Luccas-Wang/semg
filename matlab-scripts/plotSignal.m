function t0_hat = plotSignal()
clear;      % clear variables
close all;  % clear graphs
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

global orangeL orangeD lilaL lilaD
orangeL = [0.9922    0.7490    0.4353];
lilaL   = [0.7922    0.6980    0.8392];
orangeD = [1.0000    0.4980         0];
lilaD   = [0.4157    0.2392    0.6039];

% generate simulated first
handles.top_rightIs = 'simulated';
t0 = 500;
handles.variance = [ones(t0,1);5*ones(t0,1)]; 
handles.y = simSig(handles.variance);
handles.sy = cumsum(handles.y.^2);

% calculate the onset time
%window size
L = 100;
%threshold
h=10;
%offset for postprocesser
Delta=5;
%single mode
mode='single';

[handles.t0_hat,handles.ta,handles.g0,handles.ga,handles.thetas_b,handles.thetas_a,handles.thetas_0]=saglrstepvarWithThetas(handles.y,L,h,Delta,mode,0);
drawPlots(handles, L, t0);
t0_hat = handles.t0_hat;
% Create a button to refresh
% handles = uicontrol('Style', 'togglebutton', 'String', 'New Signal',...
%           'Position', [30 260 100 30],...
%           'Callback', {@newSignal, handles, L, h, Delta, mode}); 
end

function s = simSig(variance)
    s = sqrt(variance).*randn(size(variance));
end

function updatedHandles = drawPlots(handles, L, t0)
global orangeL  lilaL 
sigL=size(handles.y,1);
    handles.gui = figure(1);
    set(handles.gui, 'Position', [0 0 1000 600]);
%plot histogram of emg data
handles.top_left = subplot(2,2,1);
    set(handles.top_left,'position',[0.03, 0.55, 0.15, 0.4]);
    [nb,xb]=hist(handles.y(handles.ta-L:handles.ta),(-8:1:8));
    bell=barh(xb,nb);
    set(bell,'facecolor',orangeL,'EdgeColor','None');
    set(bell,'YDataSource','nb');
    set(bell,'XDataSource','xb');
    ylim([-8 8]);
    title('Histogram of sEMG Data');
%plot emg data
    handles.top_right = subplot(2,2,2);
    set(handles.top_right,'position',[0.23, 0.55, 0.73, 0.4])
    %deadzones
    fill([0 0 L L],[-8 8 8 -8],[0.8,0.8,0.8],'EdgeColor','None');
    hold on
    handles.area_previous = fill([L L handles.ta-L handles.ta-L],[-8 8 8 -8],lilaL,'EdgeColor','None');
    set(handles.area_previous,'HitTest','off');
    handles.area_k = fill([handles.ta-L handles.ta-L handles.ta handles.ta],[-8 8 8 -8],orangeL,'EdgeColor','None');
    set(handles.area_k,'HitTest','off');
    fill([sigL-L sigL-L sigL sigL],[-8 8 8 -8],[0.8,0.8,0.8],'EdgeColor','None');
    handles.signal = plot(handles.y,'YDataSource','handles.y');
    ylim([-8 8]);
    hold on
    plot(sqrt(handles.variance),'Color',[0.8510    0.3725    0.0078],'YDataSource','handles.variance');
    t0_line_a = line([handles.t0_hat handles.t0_hat],[-8 8],'Color','r');
    set(t0_line_a,'HitTest','off');
    ta_line_a = line([handles.ta handles.ta],[-8 8],'Color','g');
    set(ta_line_a,'HitTest','off');
    title('simulated sEMG Data');
    legend('deadzone1', 'previosChange till k-L', 'k-L till k', 'deadzone2', 'signal y', ['variance profile with t_0 = ',num2str(t0)], 'aglrStep: estimated t_0', 'aglrStep: alarm time t_a');
%plot cumulated sum of quadratic emg data
handles.bottom_right = subplot(2,2,4);
    set(handles.bottom_right,'position',[0.23, 0.05, 0.73, 0.4])
    % deadzone 1
    fill([0 0 L L],[min(handles.g0) max(handles.sy) max(handles.sy) min(handles.g0)],[0.8,0.8,0.8],'EdgeColor','None');
    hold on
    % lila
    handles.area_previous2 = fill([L L handles.ta-L handles.ta-L],[min(handles.g0) max(handles.sy) max(handles.sy) min(handles.g0)],lilaL,'EdgeColor','None');
    set(handles.area_previous2,'HitTest','off');
    % orange
    handles.area_k2 = fill([handles.ta-L handles.ta-L handles.ta handles.ta],[min(handles.g0) max(handles.sy) max(handles.sy) min(handles.g0)],orangeL,'EdgeColor','None');
    set(handles.area_k2,'HitTest','off')
    % deadzone 2
    fill([sigL-L sigL-L sigL sigL],[min(handles.g0) max(handles.sy) max(handles.sy) min(handles.g0)],[0.8,0.8,0.8],'EdgeColor','None');
    t0_line = line([t0 t0],[min(handles.g0) max(handles.sy)],'Color',[0.8510    0.3725    0.0078]);
    set(t0_line,'HitTest','off');
    t0_hat_line = line([handles.t0_hat handles.t0_hat],[min(handles.g0) max(handles.sy)],'Color','r');
    set(t0_hat_line,'HitTest','off');
    ta_line = line([handles.ta handles.ta],[min(handles.g0) max(handles.sy)],'Color','g');
    set(ta_line,'HitTest','off');
    title('cummulated sum of squares of signal');
% activate mouse button-down function on second plot
    set(gca,'ButtonDownFcn',{@mark_area,handles,L,orangeL});
    handles.sumy2 = plot(handles.sy,'YDataSource','handles.sy');
    ylim([0 max(handles.sy)]);
% activate mouse button-down function on first plot
    axes(handles.top_right);
    set(gca,'ButtonDownFcn',{@mark_area,handles,L,orangeL});
    set(gca,'Layer','top');
    axes(handles.bottom_right);
    set(gca,'Layer','top');
% Create the button group.
    handles.radiobuttons = uibuttongroup('visible','off','Position',[0.03 0.05 0.15 0.2]);
    % Create three radio buttons in the button group.
    uicontrol('Style','radiobutton','String','g_0',...
        'pos',[10 70 100 30],'parent',handles.radiobuttons,'HandleVisibility','off');
    uicontrol('Style','radiobutton','String','g_a',...
        'pos',[10 40 100 30],'parent',handles.radiobuttons,'HandleVisibility','off');
    handles.radio_cumsum = uicontrol('Style','radiobutton','String','cumsum(y^2)',...
        'pos',[10 10 100 30],'parent',handles.radiobuttons,'HandleVisibility','off');
    % Initialize some button group properties. 
    set(handles.radiobuttons,'SelectionChangeFcn',{@plot_selected, handles});
    set(handles.radiobuttons,'SelectedObject',handles.radio_cumsum);  % No selection
    set(handles.radiobuttons,'Visible','on');
    updatedHandles=handles;
end

function mark_area(gca, ~, handles,L,orangeL)
    % update colored area in upper right plot
    axes(handles.top_right)
    point = round(get(gca,'CurrentPoint'));
    k = point(1,1);
    set(handles.area_k, 'XData', [k-L k-L k k]);
    set(handles.area_previous, 'XData', [L L k-L k-L]);
    % update colored area in down right plot
    axes(handles.bottom_right)
    set(handles.area_k2, 'XData', [k-L k-L k k]);
    set(handles.area_previous2, 'XData', [L L k-L k-L]);
    % calc histogram
    axes(handles.top_left)
    [nb,xb]=hist(handles.y(k-L:k),(-8:1:8));
    bell=barh(xb,nb);
    set(bell,'facecolor',orangeL,'EdgeColor','None');
    ylim([-8 8]);
end

function plot_selected(~,eventdata,handles)
global orangeD  lilaD 
%handles = guidata(handles.gui)
 switch get(eventdata.NewValue,'String')
     case 'g_0'
         axes(handles.bottom_right);
         title('g_0(j)=-.5*( (j-PreviousChange).*log(theta_b)+(k-j).*log(theta_a) )');
         set(handles.sumy2,'YData',handles.g0);
         axes(handles.bottom_right);
         ylim([min(handles.g0) max(handles.g0)]);
         legend('off')
     case 'g_a'
         h = zeros(4);
         axes(handles.bottom_right);
         title('g_a(k)=-.5*( (k-L-PreviousChange)*log(theta_b)+L*log(theta_a)-(k-PreviousChange)*log(theta_0) )');
         set(handles.sumy2,'YData',handles.ga);
         h(1) = handles.sumy2;
         h(4) = plot(log(handles.thetas_b),'Color',lilaD);
         h(3) = plot(log(handles.thetas_a),'Color',orangeD);
         h(2) = plot(log(handles.thetas_0),'Color','k');
         axes(handles.bottom_right);
         ylim([-1 max(handles.ga(301:500)+2)]);
         legend(h(2:4),'log(thetas_0)','log(thetas_a)','log(thetas_b)')
     otherwise
         axes(handles.bottom_right);
         legend('off')
         title('cummulated sum of squares of signal');
         set(handles.sumy2,'YData',handles.sy);
         axes(handles.bottom_right);
         ylim([0 max(handles.sy)]);
 end
end

% function updatedHandles = newSignal(~,~,handles,L,h,Delta,mode)
%     %axes(handles.top_right);
%     handles.y=simSig(handles.variance);
%     handles.sy=cumsum(handles.y.^2);
%     %refreshdata
%     set(handles.signal, 'YData', handles.y);
%     set(handles.sumy2,'YData',handles.sy);
%     axes(handles.bottom_right);
%     ylim([0 max(handles.sy)]);
%     set(handles.radiobuttons,'SelectedObject',handles.radio_cumsum);
%     
%     %set(handles.sumy2, 'YData', sy);
%     [handles.t0_hat,handles.ta,handles.g0,handles.ga,handles.thetas_b,handles.thetas_a,handles.thetas_0]=saglrstepvarWithThetas(handles.y,L,h,Delta,mode,0);
%     
%     updatedHandles=handles;
%     guidata(handles.gui,handles);
%     %refreshdata
% end

