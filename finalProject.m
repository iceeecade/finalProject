function [] = finalProject()
global asdf

% [X-POS Y-POS X-LENGTH Y-LENGTH]

%   TITLE
asdf.fig = figure('numbertitle', 'off', 'name', 'Final Project');
asdf.titleInput = uicontrol('style', 'edit', 'units', 'normalized', 'position',[0.6 0.95 0.2 0.04], 'callback', @changeTitle);
asdf.titleText = uicontrol('style', 'text', 'units', 'normalized', 'position', [0.5 0.95 0.1 0.04], 'string', 'Plot Title:');
asdf.titleLabel = uicontrol('style', 'text', 'units', 'normalized', 'position', [0.15 0.91 0.3 0.1],'string', 'Title...', 'fontsize',25);
    function [] = changeTitle(source, event)
        asdf.titleLabel.String = asdf.titleInput.String;
    end

%   X AXIS
asdf.primaryHorizontalInput = uicontrol('style', 'edit', 'units', 'normalized', 'position',[0.9 0.2 0.1 0.1], 'callback', @primaryHorizontal);
asdf.primaryHorizontalText = uicontrol('style', 'text', 'units', 'normalized', 'position',[0.8 0.175 0.1 0.1], 'string', 'X-Axis Label:');
asdf.primaryHorizontalLabel = uicontrol('style', 'text', 'units', 'normalized', 'position',[0.33 0.06 0.2 0.1], 'string', 'X-Axis');
    function [] = primaryHorizontal(source, event)
        asdf.primaryHorizontalLabel.String = asdf.primaryHorizontalInput.String;
    end

%   Y AXIS
asdf.primaryVerticalInput = uicontrol('style', 'edit', 'units', 'normalized', 'position',[0.9 0.1 0.1 0.1], 'callback', @primaryVertical);
asdf.primaryVerticalText = uicontrol('style', 'text', 'units', 'normalized', 'position',[0.8 0.075 0.1 0.1], 'string', 'Y-Axis Label:');
asdf.primaryVerticalLabel = uicontrol('style', 'text', 'units', 'normalized', 'position',[0 0.92 0.15 0.05],'string', 'Y-Axis');
    function [] = primaryVertical(source, event)
        asdf.primaryVerticalLabel.String = asdf.primaryVerticalInput.String;
    end

%   EMPTY PLOT
asdf.plot = plot(0.0);
asdf.plot.Parent.Position = [0.075 0.2 0.7 0.7];

%   X INPUT
asdf.xValueInput = uicontrol('style', 'edit', 'units', 'normalized', 'position',[0.9 0.8 0.1 0.1]);
asdf.xValueInputText =  uicontrol('style', 'text', 'units', 'normalized', 'position',[0.8 0.765 0.1 0.1], 'string', 'X-Values:');

%   Y INPUT
asdf.yValueInput = uicontrol('style', 'edit', 'units', 'normalized', 'position',[0.9 0.9 0.1 0.1]);
asdf.yValueInputText = uicontrol('style', 'text', 'units', 'normalized', 'position',[0.8 0.865 0.1 0.1], 'string', 'Y-Values:');

%   PLOT BUTTON
asdf.plotButton = uicontrol('style', 'pushbutton', 'units', 'normalized', 'position', [0.6 0 0.2 0.1], 'string', 'PLOT FUNCTION', 'callback', {@graph}, 'backgroundColor', '#77AC30');

%   CLEAR BUTTON
asdf.clearButton = uicontrol('style', 'pushbutton', 'units', 'normalized', 'position', [0.8 0 0.2 0.1], 'string', 'CLEAR', 'callback', {@clear}, 'backgroundColor', '#A2142F');

%   COLOR BUTTON
asdf.color = uibuttongroup('visible', 'on', 'position', [0 0 0.4 0.07], 'units', 'normalized');
asdf.red = uicontrol(asdf.color, 'style', 'radiobutton', 'units', 'normalized', 'string', 'r', 'position', [0 0.3 0.3 0.4], 'HandleVisibility', 'off');
asdf.blue = uicontrol(asdf.color, 'style', 'radiobutton', 'units', 'normalized', 'string', 'b', 'position', [0.35 0.3 0.3 0.4], 'HandleVisibility', 'off');
asdf.green = uicontrol(asdf.color, 'style', 'radiobutton', 'units', 'normalized', 'string', 'g', 'position', [.7 0.3 0.3 0.4], 'HandleVisibility', 'off');

%   POINT BUTTON
asdf.point = uibuttongroup('visible', 'on', 'position', [0 0.06 0.4 0.07], 'units', 'normalized');
asdf.circle = uicontrol(asdf.point, 'style', 'radiobutton', 'units', 'normalized', 'string', 'o', 'position', [0 0.3 0.3 0.4], 'HandleVisibility', 'off');
asdf.dash = uicontrol(asdf.point, 'style', 'radiobutton', 'units', 'normalized', 'string', '--', 'position', [0.35 0.3 0.3 0.4], 'HandleVisibility', 'off');
asdf.star = uicontrol(asdf.point, 'style', 'radiobutton', 'units', 'normalized', 'string', '*', 'position', [0.7 0.3 0.3 0.4], 'HandleVisibility', 'off');

%   X MAX/MIN
asdf.xMaxInput = uicontrol('style', 'edit', 'units', 'normalized', 'position',[0.9 0.65 0.1 0.1]);
asdf.xMaxText = uicontrol('style', 'text', 'units', 'normalized', 'position',[0.8 0.625 0.1 0.1], 'string', 'X-Max:');

asdf.xMinInput = uicontrol('style', 'edit', 'units', 'normalized', 'position',[0.9 0.425 0.1 0.1]);
asdf.xMinText = uicontrol('style', 'text', 'units', 'normalized', 'position',[0.8 0.4 0.1 0.1], 'string', 'X-Min:');

%   Y MAX/MIN
asdf.yMaxInput = uicontrol('style', 'edit', 'units', 'normalized', 'position',[0.9 0.55 0.1 0.1]);
asdf.yMaxText = uicontrol('style', 'text', 'units', 'normalized', 'position',[0.8 0.525 0.1 0.1], 'string', 'Y-Max:');

asdf.yMinInput = uicontrol('style', 'edit', 'units', 'normalized', 'position',[0.9 0.325 0.1 0.1]);
asdf.yMinText = uicontrol('style', 'text', 'units', 'normalized', 'position',[0.8 0.3 0.1 0.1], 'string', 'Y-Min:');

%   PLOT
    function [] = graph(~,~)
        if isempty(asdf.xValueInput.String) || isempty(asdf.yValueInput.String)
            msgbox('Input Variables Required')
            return
        end
        
    xValue = str2num(asdf.xValueInput.String);
    yValue = str2num(asdf.yValueInput.String);
        
        if length(xValue) ~= length(yValue)
            msgbox('Number of X values and Y Values must be the same')
            return
        end
        
    lineType = asdf.point.SelectedObject.String;
    lineColor = asdf.color.SelectedObject.String;
    lineStyle = strcat(lineType, lineColor);
    
        if ~isempty(asdf.xMaxInput.String) && ~isempty(asdf.xMinInput.String)
            xMax = str2double(asdf.xMaxInput.String);
            xMin = str2double(asdf.xMinInput.String);
            xlim([xMin, xMax]);
        end
        if ~isempty(asdf.yMaxInput.String) && ~isempty(asdf.yMinInput.String)
            yMax = str2double(asdf.yMaxInput.String);
            yMin = str2double(asdf.yMinInput.String);
            ylim([yMin, yMax]);
        end
            asdf.Plot = plot(xValue, yValue, lineStyle);
    end
%   CLEAR FUNCTION
    function [] = clear(source, event)
        asdf.plot = plot(0,0);
        asdf.plot.Parent.Position = [0.075 0.2 0.7 0.7];
        
        set(asdf.primaryHorizontalLabel, 'String', 'X-Axis Label');
        set(asdf.primaryVerticalLabel, 'String', 'Y-Axix Label');
        set(asdf.primaryHorizontalInput, 'String', '');
        set(asdf.primaryVerticalInput, 'String', '');
        set(asdf.titleInput, 'String', '');
        set(asdf.xValueInput, 'String', '');
        set(asdf.yValueInput, 'String', '');
        set(asdf.xMaxInput, 'String', '');
        set(asdf.xMinInput, 'String', '');
        set(asdf.yMaxInput, 'String', '');
        set(asdf.yMinInput, 'String', '');
    end
end