{ pkgs, inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;
    colors = {
      # you must set ALL of these

      mError = "#eb6f92";
      mHover = "#524f67";
      mOnError = "#191724";
      mOnHover = "#e0def4";
      mOnPrimary = "#191724";
      mOnSecondary = "#191724";
      mOnSurface = "#e0def4";
      mOnSurfaceVariant = "#908caa";
      mOnTertiary = "#e0def4";
      mOutline = "#403d52";
      mPrimary = "#ebbcba";
      mSecondary = "#9ccfd8";
      mShadow = "#191724";
      mSurface = "#191724";
      mSurfaceVariant = "#26233a";
      mTertiary = "#31748f";

    };
    settings = {
      appLauncher = {
        enableClipPreview = true;
        position = "center";
        sortByMostUsed = true;
        terminalCommand = "kiity -e";
        useApp2Unit = false;
        viewMode = "list";
      };
      audio = {
        cavaFrameRate = 30;
        externalMixer = "pwvucontrol || pavucontrol";
        preferredPlayer = "mpv";
        visualQuality = "high";
        visualizerType = "linear";
        volumeOverdrive = true;
        volumeStep = 5;
      };
      brightness = {
        brightnessStep = 5;
        enableDdcSupport = false;
        enforceMinimum = true;
      };
      calendar = {
        cards = [
          {
            enabled = true;
            id = "banner-card";
          }
          {
            enabled = true;
            id = "calendar-card";
          }
          {
            enabled = true;
            id = "timer-card";
          }
          {
            enabled = false;
            id = "weather-card";
          }
        ];
      };
      colorSchemes = {
        darkMode = true;
        generalTemplatesForPredefined = false;
        predefinedScheme = "Rosepine";
        schedulingMode = false;
        useWallpaperColors = false;
      };
      controlCenter = {
        cards = [
          {
            enabled = true;
            id = "profile-card";
          }
          {
            enabled = true;
            id = "shortcuts-card";
          }
          {
            enabled = true;
            id = "audio-card";
          }
          {
            enabled = false;
            id = "weather-card";
          }
          {
            enabled = true;
            id = "media-sysmon-card";
          }
        ];
        position = "close_to_bar_button";
        shortcuts = {
          left = [
            {
              id = "WiFi";
            }
            {
              id = "Bluetooth";
            }
            {
              id = "ScreenRecorder";
            }
            {
              id = "WallpaperSelector";
            }
          ];
          right = [
            {
              id = "Notifications";
            }
            {
              id = "PowerProfile";
            }
            {
              id = "KeepAwake";
            }
            {
              id = "NightLight";
            }
          ];
        };
      };
      dock = {
        enabled = false;
      };
      general = {
        allowPanelOnScreenWithoutBar = true;
        animationDisabled = false;
        animationSpeed = 1.8;
        compactLockScreen = false;
        dimmerOpacity = 0.3;
        enableShadows = true;
        forceBlackScreenCorners = false;
        LockOnSuspend = false;
        radiusRatio = 1;
        scaleRatio = 1;
        screenRadiusRatio = 1;
        shadowDirection = "bottom_right";
        shadowOffsetX = 2;
        shadowOffsetY = 3;
        showHibernateOnLockScreen = false;
        showScreenCorners = false;
      };
      hooks = {
        enabled = false;
      };
      location = {
        weatherEnabled = false;
        useFahrenheit = false;
        use12hourFormat = true;
        showWeekNumberInCalendar = false;
        showCalendarEvents = true;
        showCalendarWeather = true;
        name = "Tokyo";
        firstDayOfWeek = -1;
        analogClockInCalendar = false;
      };
      network = {
        wifiEnabled = true;
      };
      nightLight = {
        enabled = false;
      };
      notifications = {
        backgroundOpacity = 1;
        criticalUrgencyDuration = 15;
        enableKeyboardLayoutToast = true;
        enabled = true;
        location = "top_right";
        lowUrgencyDuration = 3;
        normalUrgencyDuration = 8;
        overlayLayer = true;
        respectExpireTimeout = false;
      };
      osd = {
        autoHideMs = 300;
        backgroundOpacity = 1;
        enabled = true;
        enabledTypes = [
          0
          1
          2
        ];
        location = "top_right";
        overlayLayer = true;
      };
      screenRecorder = {
        audioCodec = "opus";
        audioSource = "default_output";
        colorRange = "limited";
        directory = "/home/nix/videos";
        frameRate = 60;
        quality = "very_high";
        showCursor = true;
        videCodec = "h264";
        videoSource = "portal";
      };
      sessionMenu = {
        countdownDuration = 10000;
        enableCountdown = true;
        position = "center";
        powerOptions = [
          {
            action = "lock";
            countDownEnabled = true;
            enabled = true;
          }
          {
            action = "suspend";
            countDownEnabled = true;
            enabled = false;
          }
          {
            action = "hibernate";
            countDownEnabled = true;
            enabled = false;
          }
          {
            action = "reboot";
            countDownEnabled = true;
            enabled = true;
          }
          {
            action = "logout";
            countDownEnabled = true;
            enabled = true;
          }
          {
            action = "shutdown";
            countDownEnabled = true;
            enabled = true;
          }
        ];
        showHeader = true;
      };
      systemMonitor = {
        cpuCriticalThreshold = 90;
        cpuPollingInterval = 3000;
        cpuWarningThreshold = 80;
        diskCriticlaThreshold = 90;
        diskPollingInterval = 3000;
        diskWarningThreshold = 80;
        memCriticlaThreshold = 90;
        memPollingInterval = 3000;
        memWarningThreshold = 80;
        networkPollingInterval = 3000;
        tempCriticlaThreshold = 90;
        tempPollingInterval = 3000;
        tempWarningThreshold = 80;
        useCustomColors = false;

      };
      templates = {
        gtk = false;
        qt = false;
        kcolorscheme = false;
        alacritty = false;
        kitty = false;
        ghostty = false;
        foot = false;
        wezterm = false;
        fuzzel = false;
        discord = false;
        pywalfox = false;
        vicinae = false;
        walker = false;
        code = false;
        spicetify = false;
        telegram = false;
        cava = false;
        enableUserTemplates = false;
      };
      ui = {
        fontDefault = "Roboto";
        fontDefaultScale = 1;
        fontFixed = "FiraCode Nerd Font";
        fontFixedScale = 1;
        panelBackgroundOpacity = 0.8;
        settingsAttachedToBar = true;
        tooltipsEnabled = true;
      };
      wallpaper = {
        enabled = true;
        panelPosition = "follow_bar";
        overviewEnabled = false;
        directory = "/home/nix/Pictures/Wallpapers";
        fillMode = "crop";
        fillColor = "#000000";
        randomEnabled = false;
        randomIntervalSec = 300;
        transitionDuration = 1500;
        transitionType = "random";
        transitionEdgeSmoothness = 0.05;
        hideWallpaperFilenames = false;
        useWallhaven = false;
        wallhavenQuery = "";
        wallhavenSorting = "relevance";
        wallhavenOrder = "desc";
        wallhavenCategories = "111";
        wallhavenPurity = "100";
        wallhavenResolutionMode = "atleast";
        wallhavenResolutionWidth = "";
        wallhavenResolutionHeight = "";
        defaultWallpaper = "/home/nix/Pictures/Wallpapers/purplish-mountains.png";
      };

      bar = {
        position = "top";
        backgroundOpacity = 1;
        capsuleOpacity = 1;
        density = "default";
        exclusive = true;
        floating = false;
        marginHorizontal = 0.25;
        marginVertical = 0.25;
        outerCorners = true;
        showCapsule = true;
        widgets = {
          center = [
            {
              hideMode = "hidden";
              hideWhenIdle = false;
              id = "MediaMini";
              maxWidth = 145;
              scrollingMode = "hover";
              showAlbumArt = false;
              showArtistFirst = true;
              showProgressRing = true;
              sowVisualizer = false;
              useFixedWidth = false;
              visualizerType = "linear";
            }
            {
              colorizeIcons = false;
              hideMode = "hidden";
              id = "ActiveWindow";
              maxWidth = 145;
              scrollingMode = "hover";
              showIcone = true;
              useFixedWidth = false;
            }
          ];
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
            {
              id = "SystemMonitor";
              diskPath = "/";
              showCpuTemp = true;
              showDiskUsage = false;
              showMemoryAsPercent = false;
              showMemoryUsage = true;
              showNetworkStats = false;
              usePrimaryColor = false;
            }
            {
              id = "Workspace";
              characterCount = 2;
              followFocusedScreen = false;
              hideUnoccupied = true;
              labelMode = "index";
            }
          ];
          right = [
            {
              id = "KeyboardLayout";
              displayMode = "onhover";
            }
            {
              id = "ScreenRecorder";
            }
            {
              id = "Tray";
              drawerEnabled = true;
              colorizeIcons = false;
            }
            {
              id = "NotificationHistory";
              hideWhenZero = true;
              showUnreadBadge = true;
            }
            {
              id = "Battery";
              displayMode = "onhover";
              warningThreshold = 30;
            }
            {
              id = "Volume";
              displayMode = "onhover";
            }
            {
              id = "Brightness";
              displayMode = "onhover";
            }
            {
              id = "Clock";
              formatHorizontal = "HH:m ddd, MMM dd";
              formatVertical = "HH mm - dd MM";
              useCustomFont = false;
              usePrimaryColor = true;
            }

          ];
        };
      };
    };
  };
}
