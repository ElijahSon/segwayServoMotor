  function targMap = targDataMap(),

  ;%***********************
  ;% Create Parameter Map *
  ;%***********************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 12;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc paramMap
    ;%
    paramMap.nSections           = nTotSects;
    paramMap.sectIdxOffset       = sectIdxOffset;
      paramMap.sections(nTotSects) = dumSection; %prealloc
    paramMap.nTotData            = -1;
    
    ;%
    ;% Auto data (nedbhqru5o)
    ;%
      section.nData     = 55;
      section.data(55)  = dumData; %prealloc
      
	  ;% nedbhqru5o.K
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% nedbhqru5o.TECH
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 4;
	
	  ;% nedbhqru5o.FiltrecomplementaireTustinappro
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 5;
	
	  ;% nedbhqru5o.GyroFullScaleint_Value
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 6;
	
	  ;% nedbhqru5o.GyroFullScaledegs_Value
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 7;
	
	  ;% nedbhqru5o.AccelerofullscaleG_Value
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 8;
	
	  ;% nedbhqru5o.AcceleroFullScaleint_Value
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 9;
	
	  ;% nedbhqru5o.contrereaction_Gain
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 10;
	
	  ;% nedbhqru5o.CommandeV_Y0
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 11;
	
	  ;% nedbhqru5o.CommandeV1_Y0
	  section.data(10).logicalSrcIdx = 9;
	  section.data(10).dtTransOffset = 12;
	
	  ;% nedbhqru5o.U_leftlimitedV_UpperSat
	  section.data(11).logicalSrcIdx = 10;
	  section.data(11).dtTransOffset = 13;
	
	  ;% nedbhqru5o.U_leftlimitedV_LowerSat
	  section.data(12).logicalSrcIdx = 11;
	  section.data(12).dtTransOffset = 14;
	
	  ;% nedbhqru5o.U_rightlimitedV_UpperSat
	  section.data(13).logicalSrcIdx = 12;
	  section.data(13).dtTransOffset = 15;
	
	  ;% nedbhqru5o.U_rightlimitedV_LowerSat
	  section.data(14).logicalSrcIdx = 13;
	  section.data(14).dtTransOffset = 16;
	
	  ;% nedbhqru5o.thetaestimerd_Y0
	  section.data(15).logicalSrcIdx = 14;
	  section.data(15).dtTransOffset = 17;
	
	  ;% nedbhqru5o.lowpassfilter_NumCoef
	  section.data(16).logicalSrcIdx = 15;
	  section.data(16).dtTransOffset = 18;
	
	  ;% nedbhqru5o.lowpassfilter_DenCoef
	  section.data(17).logicalSrcIdx = 16;
	  section.data(17).dtTransOffset = 20;
	
	  ;% nedbhqru5o.lowpassfilter_InitialStates
	  section.data(18).logicalSrcIdx = 17;
	  section.data(18).dtTransOffset = 22;
	
	  ;% nedbhqru5o.Gain_Gain
	  section.data(19).logicalSrcIdx = 18;
	  section.data(19).dtTransOffset = 23;
	
	  ;% nedbhqru5o.speedms_Y0
	  section.data(20).logicalSrcIdx = 19;
	  section.data(20).dtTransOffset = 24;
	
	  ;% nedbhqru5o.Accenms2_Value
	  section.data(21).logicalSrcIdx = 20;
	  section.data(21).dtTransOffset = 25;
	
	  ;% nedbhqru5o.speedenms_InitialCondition
	  section.data(22).logicalSrcIdx = 21;
	  section.data(22).dtTransOffset = 26;
	
	  ;% nedbhqru5o.Saturation_UpperSat
	  section.data(23).logicalSrcIdx = 22;
	  section.data(23).dtTransOffset = 27;
	
	  ;% nedbhqru5o.Saturation_LowerSat
	  section.data(24).logicalSrcIdx = 23;
	  section.data(24).dtTransOffset = 28;
	
	  ;% nedbhqru5o.Quantizer_Interval
	  section.data(25).logicalSrcIdx = 24;
	  section.data(25).dtTransOffset = 29;
	
	  ;% nedbhqru5o.Gain_Gain_olluun32x4
	  section.data(26).logicalSrcIdx = 25;
	  section.data(26).dtTransOffset = 30;
	
	  ;% nedbhqru5o.Constant1_Value
	  section.data(27).logicalSrcIdx = 26;
	  section.data(27).dtTransOffset = 31;
	
	  ;% nedbhqru5o.Constant_Value
	  section.data(28).logicalSrcIdx = 27;
	  section.data(28).dtTransOffset = 32;
	
	  ;% nedbhqru5o.anglerad_Y0
	  section.data(29).logicalSrcIdx = 28;
	  section.data(29).dtTransOffset = 33;
	
	  ;% nedbhqru5o.Speed0_Threshold
	  section.data(30).logicalSrcIdx = 29;
	  section.data(30).dtTransOffset = 34;
	
	  ;% nedbhqru5o.speedenrds_Value
	  section.data(31).logicalSrcIdx = 30;
	  section.data(31).dtTransOffset = 35;
	
	  ;% nedbhqru5o.angleenrad_InitialCondition
	  section.data(32).logicalSrcIdx = 31;
	  section.data(32).dtTransOffset = 36;
	
	  ;% nedbhqru5o.Saturation_UpperSat_laawyukirp
	  section.data(33).logicalSrcIdx = 32;
	  section.data(33).dtTransOffset = 37;
	
	  ;% nedbhqru5o.Saturation_LowerSat_pjistqqcmw
	  section.data(34).logicalSrcIdx = 33;
	  section.data(34).dtTransOffset = 38;
	
	  ;% nedbhqru5o.Gain1_Gain
	  section.data(35).logicalSrcIdx = 34;
	  section.data(35).dtTransOffset = 39;
	
	  ;% nedbhqru5o.DiscreteTransferFcn_NumCoef
	  section.data(36).logicalSrcIdx = 35;
	  section.data(36).dtTransOffset = 40;
	
	  ;% nedbhqru5o.DiscreteTransferFcn_DenCoef
	  section.data(37).logicalSrcIdx = 36;
	  section.data(37).dtTransOffset = 41;
	
	  ;% nedbhqru5o.DiscreteTransferFcn_InitialStat
	  section.data(38).logicalSrcIdx = 37;
	  section.data(38).dtTransOffset = 43;
	
	  ;% nedbhqru5o.RayonRoueenm_Value
	  section.data(39).logicalSrcIdx = 38;
	  section.data(39).dtTransOffset = 44;
	
	  ;% nedbhqru5o.Ecartementrouesenm2_Value
	  section.data(40).logicalSrcIdx = 39;
	  section.data(40).dtTransOffset = 45;
	
	  ;% nedbhqru5o.pwmMax_Value
	  section.data(41).logicalSrcIdx = 40;
	  section.data(41).dtTransOffset = 46;
	
	  ;% nedbhqru5o.UAlimVolt_Value
	  section.data(42).logicalSrcIdx = 41;
	  section.data(42).dtTransOffset = 47;
	
	  ;% nedbhqru5o.Gain_Gain_abrzp0on2x
	  section.data(43).logicalSrcIdx = 42;
	  section.data(43).dtTransOffset = 48;
	
	  ;% nedbhqru5o.Constant5_Value
	  section.data(44).logicalSrcIdx = 43;
	  section.data(44).dtTransOffset = 49;
	
	  ;% nedbhqru5o.Constant6_Value
	  section.data(45).logicalSrcIdx = 44;
	  section.data(45).dtTransOffset = 50;
	
	  ;% nedbhqru5o.Constant1_Value_jcrvfxkqff
	  section.data(46).logicalSrcIdx = 45;
	  section.data(46).dtTransOffset = 51;
	
	  ;% nedbhqru5o.Constant3_Value
	  section.data(47).logicalSrcIdx = 46;
	  section.data(47).dtTransOffset = 52;
	
	  ;% nedbhqru5o.Constant2_Value
	  section.data(48).logicalSrcIdx = 47;
	  section.data(48).dtTransOffset = 53;
	
	  ;% nedbhqru5o.wenrds2_Gain
	  section.data(49).logicalSrcIdx = 48;
	  section.data(49).dtTransOffset = 54;
	
	  ;% nedbhqru5o.Constant1_Value_igwio23u1p
	  section.data(50).logicalSrcIdx = 49;
	  section.data(50).dtTransOffset = 55;
	
	  ;% nedbhqru5o.Constant3_Value_jhbrmfdnad
	  section.data(51).logicalSrcIdx = 50;
	  section.data(51).dtTransOffset = 56;
	
	  ;% nedbhqru5o.OffsetLeft_Value
	  section.data(52).logicalSrcIdx = 51;
	  section.data(52).dtTransOffset = 57;
	
	  ;% nedbhqru5o.OffsetRight_Value
	  section.data(53).logicalSrcIdx = 52;
	  section.data(53).dtTransOffset = 58;
	
	  ;% nedbhqru5o.Gyroens_Gain
	  section.data(54).logicalSrcIdx = 53;
	  section.data(54).dtTransOffset = 59;
	
	  ;% nedbhqru5o.Constant4_Value
	  section.data(55).logicalSrcIdx = 54;
	  section.data(55).dtTransOffset = 60;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(1) = section;
      clear section
      
      section.nData     = 15;
      section.data(15)  = dumData; %prealloc
      
	  ;% nedbhqru5o.gyroxendegress_Y0
	  section.data(1).logicalSrcIdx = 55;
	  section.data(1).dtTransOffset = 0;
	
	  ;% nedbhqru5o.acceleroeng_Y0
	  section.data(2).logicalSrcIdx = 56;
	  section.data(2).dtTransOffset = 1;
	
	  ;% nedbhqru5o.UmVolt_Y0
	  section.data(3).logicalSrcIdx = 57;
	  section.data(3).dtTransOffset = 2;
	
	  ;% nedbhqru5o.Gain1_Gain_luip00ayzb
	  section.data(4).logicalSrcIdx = 58;
	  section.data(4).dtTransOffset = 3;
	
	  ;% nedbhqru5o.dthmdt_NumCoef
	  section.data(5).logicalSrcIdx = 59;
	  section.data(5).dtTransOffset = 4;
	
	  ;% nedbhqru5o.dthmdt_DenCoef
	  section.data(6).logicalSrcIdx = 60;
	  section.data(6).dtTransOffset = 6;
	
	  ;% nedbhqru5o.dthmdt_InitialStates
	  section.data(7).logicalSrcIdx = 61;
	  section.data(7).dtTransOffset = 8;
	
	  ;% nedbhqru5o.Gain3_Gain
	  section.data(8).logicalSrcIdx = 62;
	  section.data(8).dtTransOffset = 9;
	
	  ;% nedbhqru5o.refthmleftthmrightrad_Y0
	  section.data(9).logicalSrcIdx = 63;
	  section.data(9).dtTransOffset = 10;
	
	  ;% nedbhqru5o.refthmleftthmright2rad_Y0
	  section.data(10).logicalSrcIdx = 64;
	  section.data(10).dtTransOffset = 11;
	
	  ;% nedbhqru5o.thmleft2_Gain
	  section.data(11).logicalSrcIdx = 65;
	  section.data(11).dtTransOffset = 12;
	
	  ;% nedbhqru5o.thmright2_Gain
	  section.data(12).logicalSrcIdx = 66;
	  section.data(12).dtTransOffset = 13;
	
	  ;% nedbhqru5o.CLeftRight_NumCoef
	  section.data(13).logicalSrcIdx = 67;
	  section.data(13).dtTransOffset = 14;
	
	  ;% nedbhqru5o.CLeftRight_DenCoef
	  section.data(14).logicalSrcIdx = 68;
	  section.data(14).dtTransOffset = 16;
	
	  ;% nedbhqru5o.CLeftRight_InitialStates
	  section.data(15).logicalSrcIdx = 69;
	  section.data(15).dtTransOffset = 18;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(2) = section;
      clear section
      
      section.nData     = 3;
      section.data(3)  = dumData; %prealloc
      
	  ;% nedbhqru5o.speedenms_DelayLength
	  section.data(1).logicalSrcIdx = 70;
	  section.data(1).dtTransOffset = 0;
	
	  ;% nedbhqru5o.angleenrad_DelayLength
	  section.data(2).logicalSrcIdx = 71;
	  section.data(2).dtTransOffset = 1;
	
	  ;% nedbhqru5o.UseuilOrPreviousState_DelayLeng
	  section.data(3).logicalSrcIdx = 72;
	  section.data(3).dtTransOffset = 2;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(3) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% nedbhqru5o.UseuilOrPreviousState_InitialCo
	  section.data(1).logicalSrcIdx = 73;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(4) = section;
      clear section
      
      section.nData     = 15;
      section.data(15)  = dumData; %prealloc
      
	  ;% nedbhqru5o.Nothing_Value
	  section.data(1).logicalSrcIdx = 74;
	  section.data(1).dtTransOffset = 0;
	
	  ;% nedbhqru5o.Backward_Value
	  section.data(2).logicalSrcIdx = 75;
	  section.data(2).dtTransOffset = 1;
	
	  ;% nedbhqru5o.BackwardLeft_Value
	  section.data(3).logicalSrcIdx = 76;
	  section.data(3).dtTransOffset = 2;
	
	  ;% nedbhqru5o.BackwardRight_Value
	  section.data(4).logicalSrcIdx = 77;
	  section.data(4).dtTransOffset = 3;
	
	  ;% nedbhqru5o.Forward_Value
	  section.data(5).logicalSrcIdx = 78;
	  section.data(5).dtTransOffset = 4;
	
	  ;% nedbhqru5o.ForwardLeft_Value
	  section.data(6).logicalSrcIdx = 79;
	  section.data(6).dtTransOffset = 5;
	
	  ;% nedbhqru5o.Forwardright_Value
	  section.data(7).logicalSrcIdx = 80;
	  section.data(7).dtTransOffset = 6;
	
	  ;% nedbhqru5o.ForwardLeft_Value_gipvh42jg0
	  section.data(8).logicalSrcIdx = 81;
	  section.data(8).dtTransOffset = 7;
	
	  ;% nedbhqru5o.Left_Value
	  section.data(9).logicalSrcIdx = 82;
	  section.data(9).dtTransOffset = 8;
	
	  ;% nedbhqru5o.BackwardLeft_Value_dkemk5c5cn
	  section.data(10).logicalSrcIdx = 83;
	  section.data(10).dtTransOffset = 9;
	
	  ;% nedbhqru5o.Nothing_Value_cser0issm1
	  section.data(11).logicalSrcIdx = 84;
	  section.data(11).dtTransOffset = 10;
	
	  ;% nedbhqru5o.ForwardRight_Value
	  section.data(12).logicalSrcIdx = 85;
	  section.data(12).dtTransOffset = 11;
	
	  ;% nedbhqru5o.Right_Value
	  section.data(13).logicalSrcIdx = 86;
	  section.data(13).dtTransOffset = 12;
	
	  ;% nedbhqru5o.BackwardRight_Value_h0ps0omya5
	  section.data(14).logicalSrcIdx = 87;
	  section.data(14).dtTransOffset = 13;
	
	  ;% nedbhqru5o.Constant1_Value_htbetzypke
	  section.data(15).logicalSrcIdx = 88;
	  section.data(15).dtTransOffset = 14;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(5) = section;
      clear section
      
      section.nData     = 3;
      section.data(3)  = dumData; %prealloc
      
	  ;% nedbhqru5o.b5qpq152yt.meaninput_Y0
	  section.data(1).logicalSrcIdx = 89;
	  section.data(1).dtTransOffset = 0;
	
	  ;% nedbhqru5o.b5qpq152yt.Constant_Value
	  section.data(2).logicalSrcIdx = 90;
	  section.data(2).dtTransOffset = 1;
	
	  ;% nedbhqru5o.b5qpq152yt.Delay1_InitialCondition
	  section.data(3).logicalSrcIdx = 91;
	  section.data(3).dtTransOffset = 2;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(6) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% nedbhqru5o.b5qpq152yt.Delay_InitialCondition
	  section.data(1).logicalSrcIdx = 92;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(7) = section;
      clear section
      
      section.nData     = 2;
      section.data(2)  = dumData; %prealloc
      
	  ;% nedbhqru5o.b5qpq152yt.Delay1_DelayLength
	  section.data(1).logicalSrcIdx = 93;
	  section.data(1).dtTransOffset = 0;
	
	  ;% nedbhqru5o.b5qpq152yt.Delay_DelayLength
	  section.data(2).logicalSrcIdx = 94;
	  section.data(2).dtTransOffset = 1;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(8) = section;
      clear section
      
      section.nData     = 3;
      section.data(3)  = dumData; %prealloc
      
	  ;% nedbhqru5o.kebbqx0wqlt.meaninput_Y0
	  section.data(1).logicalSrcIdx = 95;
	  section.data(1).dtTransOffset = 0;
	
	  ;% nedbhqru5o.kebbqx0wqlt.Constant_Value
	  section.data(2).logicalSrcIdx = 96;
	  section.data(2).dtTransOffset = 1;
	
	  ;% nedbhqru5o.kebbqx0wqlt.Delay1_InitialCondition
	  section.data(3).logicalSrcIdx = 97;
	  section.data(3).dtTransOffset = 2;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(9) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% nedbhqru5o.kebbqx0wqlt.Delay_InitialCondition
	  section.data(1).logicalSrcIdx = 98;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(10) = section;
      clear section
      
      section.nData     = 2;
      section.data(2)  = dumData; %prealloc
      
	  ;% nedbhqru5o.kebbqx0wqlt.Delay1_DelayLength
	  section.data(1).logicalSrcIdx = 99;
	  section.data(1).dtTransOffset = 0;
	
	  ;% nedbhqru5o.kebbqx0wqlt.Delay_DelayLength
	  section.data(2).logicalSrcIdx = 100;
	  section.data(2).dtTransOffset = 1;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(11) = section;
      clear section
      
      section.nData     = 5;
      section.data(5)  = dumData; %prealloc
      
	  ;% nedbhqru5o.mlte12umj5s.Constant_Value
	  section.data(1).logicalSrcIdx = 101;
	  section.data(1).dtTransOffset = 0;
	
	  ;% nedbhqru5o.mlte12umj5s.Constant1_Value
	  section.data(2).logicalSrcIdx = 102;
	  section.data(2).dtTransOffset = 1;
	
	  ;% nedbhqru5o.mlte12umj5s.Constant3_Value
	  section.data(3).logicalSrcIdx = 103;
	  section.data(3).dtTransOffset = 2;
	
	  ;% nedbhqru5o.mlte12umj5s.Constant4_Value
	  section.data(4).logicalSrcIdx = 104;
	  section.data(4).dtTransOffset = 3;
	
	  ;% nedbhqru5o.mlte12umj5s.Constant2_Value
	  section.data(5).logicalSrcIdx = 105;
	  section.data(5).dtTransOffset = 4;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(12) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (parameter)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    paramMap.nTotData = nTotData;
    


  ;%**************************
  ;% Create Block Output Map *
  ;%**************************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 7;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc sigMap
    ;%
    sigMap.nSections           = nTotSects;
    sigMap.sectIdxOffset       = sectIdxOffset;
      sigMap.sections(nTotSects) = dumSection; %prealloc
    sigMap.nTotData            = -1;
    
    ;%
    ;% Auto data (elrlkmpvg1q)
    ;%
      section.nData     = 8;
      section.data(8)  = dumData; %prealloc
      
	  ;% elrlkmpvg1q.iydvuu12aq
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% elrlkmpvg1q.hcv4ztvuqx
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% elrlkmpvg1q.kqifvuk0vy
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% elrlkmpvg1q.jxibmc324h
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 3;
	
	  ;% elrlkmpvg1q.gb2icj4n51
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 4;
	
	  ;% elrlkmpvg1q.goi2llvtld
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 5;
	
	  ;% elrlkmpvg1q.imf25swohx
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 6;
	
	  ;% elrlkmpvg1q.dj4i03f4r2
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 7;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(1) = section;
      clear section
      
      section.nData     = 7;
      section.data(7)  = dumData; %prealloc
      
	  ;% elrlkmpvg1q.mgbtzx1cfd
	  section.data(1).logicalSrcIdx = 8;
	  section.data(1).dtTransOffset = 0;
	
	  ;% elrlkmpvg1q.ntirfurwac
	  section.data(2).logicalSrcIdx = 9;
	  section.data(2).dtTransOffset = 1;
	
	  ;% elrlkmpvg1q.jx0lsfjlkv
	  section.data(3).logicalSrcIdx = 11;
	  section.data(3).dtTransOffset = 2;
	
	  ;% elrlkmpvg1q.o2raeeqjpi
	  section.data(4).logicalSrcIdx = 12;
	  section.data(4).dtTransOffset = 3;
	
	  ;% elrlkmpvg1q.p1w2qucnzu
	  section.data(5).logicalSrcIdx = 13;
	  section.data(5).dtTransOffset = 4;
	
	  ;% elrlkmpvg1q.is0itph5t4
	  section.data(6).logicalSrcIdx = 14;
	  section.data(6).dtTransOffset = 5;
	
	  ;% elrlkmpvg1q.nhlxote0xx
	  section.data(7).logicalSrcIdx = 15;
	  section.data(7).dtTransOffset = 6;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(2) = section;
      clear section
      
      section.nData     = 2;
      section.data(2)  = dumData; %prealloc
      
	  ;% elrlkmpvg1q.nduquffru0
	  section.data(1).logicalSrcIdx = 16;
	  section.data(1).dtTransOffset = 0;
	
	  ;% elrlkmpvg1q.fulsj3b5co
	  section.data(2).logicalSrcIdx = 18;
	  section.data(2).dtTransOffset = 1;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(3) = section;
      clear section
      
      section.nData     = 2;
      section.data(2)  = dumData; %prealloc
      
	  ;% elrlkmpvg1q.b5qpq152yt.alqhue5ivv
	  section.data(1).logicalSrcIdx = 21;
	  section.data(1).dtTransOffset = 0;
	
	  ;% elrlkmpvg1q.b5qpq152yt.mrvc4vkroa
	  section.data(2).logicalSrcIdx = 22;
	  section.data(2).dtTransOffset = 1;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(4) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% elrlkmpvg1q.b5qpq152yt.gdc2idfrkn
	  section.data(1).logicalSrcIdx = 23;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(5) = section;
      clear section
      
      section.nData     = 2;
      section.data(2)  = dumData; %prealloc
      
	  ;% elrlkmpvg1q.kebbqx0wqlt.alqhue5ivv
	  section.data(1).logicalSrcIdx = 24;
	  section.data(1).dtTransOffset = 0;
	
	  ;% elrlkmpvg1q.kebbqx0wqlt.mrvc4vkroa
	  section.data(2).logicalSrcIdx = 25;
	  section.data(2).dtTransOffset = 1;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(6) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% elrlkmpvg1q.kebbqx0wqlt.gdc2idfrkn
	  section.data(1).logicalSrcIdx = 26;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(7) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (signal)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    sigMap.nTotData = nTotData;
    


  ;%*******************
  ;% Create DWork Map *
  ;%*******************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 21;
    sectIdxOffset = 7;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc dworkMap
    ;%
    dworkMap.nSections           = nTotSects;
    dworkMap.sectIdxOffset       = sectIdxOffset;
      dworkMap.sections(nTotSects) = dumSection; %prealloc
    dworkMap.nTotData            = -1;
    
    ;%
    ;% Auto data (jop1zgxqc0r)
    ;%
      section.nData     = 2;
      section.data(2)  = dumData; %prealloc
      
	  ;% jop1zgxqc0r.gcesgas3u3
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% jop1zgxqc0r.gwlrro4h0l
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(1) = section;
      clear section
      
      section.nData     = 2;
      section.data(2)  = dumData; %prealloc
      
	  ;% jop1zgxqc0r.jaajf5xhhn
	  section.data(1).logicalSrcIdx = 2;
	  section.data(1).dtTransOffset = 0;
	
	  ;% jop1zgxqc0r.pb10scgjmo
	  section.data(2).logicalSrcIdx = 3;
	  section.data(2).dtTransOffset = 1;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(2) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% jop1zgxqc0r.moy5xx055n
	  section.data(1).logicalSrcIdx = 4;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(3) = section;
      clear section
      
      section.nData     = 2;
      section.data(2)  = dumData; %prealloc
      
	  ;% jop1zgxqc0r.g0m1oi4hgp
	  section.data(1).logicalSrcIdx = 5;
	  section.data(1).dtTransOffset = 0;
	
	  ;% jop1zgxqc0r.orf34cv4iz
	  section.data(2).logicalSrcIdx = 6;
	  section.data(2).dtTransOffset = 1;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(4) = section;
      clear section
      
      section.nData     = 5;
      section.data(5)  = dumData; %prealloc
      
	  ;% jop1zgxqc0r.obqptwgchk
	  section.data(1).logicalSrcIdx = 7;
	  section.data(1).dtTransOffset = 0;
	
	  ;% jop1zgxqc0r.n1z3fsw1x5
	  section.data(2).logicalSrcIdx = 8;
	  section.data(2).dtTransOffset = 1;
	
	  ;% jop1zgxqc0r.ckjtcdoaym
	  section.data(3).logicalSrcIdx = 9;
	  section.data(3).dtTransOffset = 2;
	
	  ;% jop1zgxqc0r.akpqh1owwl
	  section.data(4).logicalSrcIdx = 10;
	  section.data(4).dtTransOffset = 3;
	
	  ;% jop1zgxqc0r.mqbh5iipps
	  section.data(5).logicalSrcIdx = 11;
	  section.data(5).dtTransOffset = 4;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(5) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% jop1zgxqc0r.pt2meldf2i.LoggedData
	  section.data(1).logicalSrcIdx = 12;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(6) = section;
      clear section
      
      section.nData     = 4;
      section.data(4)  = dumData; %prealloc
      
	  ;% jop1zgxqc0r.a3bznkrapp
	  section.data(1).logicalSrcIdx = 13;
	  section.data(1).dtTransOffset = 0;
	
	  ;% jop1zgxqc0r.hbofvtuuw4
	  section.data(2).logicalSrcIdx = 14;
	  section.data(2).dtTransOffset = 1;
	
	  ;% jop1zgxqc0r.mlsdcs2gr1
	  section.data(3).logicalSrcIdx = 15;
	  section.data(3).dtTransOffset = 2;
	
	  ;% jop1zgxqc0r.jq35pk1nrt
	  section.data(4).logicalSrcIdx = 16;
	  section.data(4).dtTransOffset = 3;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(7) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% jop1zgxqc0r.aoo4c34w2w
	  section.data(1).logicalSrcIdx = 17;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(8) = section;
      clear section
      
      section.nData     = 7;
      section.data(7)  = dumData; %prealloc
      
	  ;% jop1zgxqc0r.kqvasydlsz
	  section.data(1).logicalSrcIdx = 18;
	  section.data(1).dtTransOffset = 0;
	
	  ;% jop1zgxqc0r.jauwa0ktwg
	  section.data(2).logicalSrcIdx = 19;
	  section.data(2).dtTransOffset = 1;
	
	  ;% jop1zgxqc0r.lexhxhymla
	  section.data(3).logicalSrcIdx = 20;
	  section.data(3).dtTransOffset = 2;
	
	  ;% jop1zgxqc0r.d0pkqoperr
	  section.data(4).logicalSrcIdx = 21;
	  section.data(4).dtTransOffset = 3;
	
	  ;% jop1zgxqc0r.ir2q0co5tv
	  section.data(5).logicalSrcIdx = 22;
	  section.data(5).dtTransOffset = 4;
	
	  ;% jop1zgxqc0r.bflccaumql
	  section.data(6).logicalSrcIdx = 23;
	  section.data(6).dtTransOffset = 5;
	
	  ;% jop1zgxqc0r.e0naxyktn2
	  section.data(7).logicalSrcIdx = 24;
	  section.data(7).dtTransOffset = 6;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(9) = section;
      clear section
      
      section.nData     = 12;
      section.data(12)  = dumData; %prealloc
      
	  ;% jop1zgxqc0r.f0wxrbvzt0
	  section.data(1).logicalSrcIdx = 25;
	  section.data(1).dtTransOffset = 0;
	
	  ;% jop1zgxqc0r.gdlyx3x5u2
	  section.data(2).logicalSrcIdx = 26;
	  section.data(2).dtTransOffset = 1;
	
	  ;% jop1zgxqc0r.dyoigqfoxi
	  section.data(3).logicalSrcIdx = 27;
	  section.data(3).dtTransOffset = 2;
	
	  ;% jop1zgxqc0r.np0fbbznsz
	  section.data(4).logicalSrcIdx = 28;
	  section.data(4).dtTransOffset = 3;
	
	  ;% jop1zgxqc0r.o4a10afnkh
	  section.data(5).logicalSrcIdx = 29;
	  section.data(5).dtTransOffset = 4;
	
	  ;% jop1zgxqc0r.nvbe0kkxup
	  section.data(6).logicalSrcIdx = 30;
	  section.data(6).dtTransOffset = 5;
	
	  ;% jop1zgxqc0r.i4qnrcpi2w
	  section.data(7).logicalSrcIdx = 31;
	  section.data(7).dtTransOffset = 6;
	
	  ;% jop1zgxqc0r.jnj5irkij4
	  section.data(8).logicalSrcIdx = 32;
	  section.data(8).dtTransOffset = 7;
	
	  ;% jop1zgxqc0r.d5zwqqx2lf
	  section.data(9).logicalSrcIdx = 33;
	  section.data(9).dtTransOffset = 8;
	
	  ;% jop1zgxqc0r.m1cluk4whq
	  section.data(10).logicalSrcIdx = 34;
	  section.data(10).dtTransOffset = 9;
	
	  ;% jop1zgxqc0r.hhy5mzbttp
	  section.data(11).logicalSrcIdx = 35;
	  section.data(11).dtTransOffset = 10;
	
	  ;% jop1zgxqc0r.hsrjtkrapp
	  section.data(12).logicalSrcIdx = 36;
	  section.data(12).dtTransOffset = 11;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(10) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% jop1zgxqc0r.b5qpq152yt.h4w1toqx31
	  section.data(1).logicalSrcIdx = 37;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(11) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% jop1zgxqc0r.b5qpq152yt.esucolvee4
	  section.data(1).logicalSrcIdx = 38;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(12) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% jop1zgxqc0r.b5qpq152yt.mc3nremms5
	  section.data(1).logicalSrcIdx = 39;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(13) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% jop1zgxqc0r.b5qpq152yt.mjrqd5o5ix
	  section.data(1).logicalSrcIdx = 40;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(14) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% jop1zgxqc0r.kebbqx0wqlt.h4w1toqx31
	  section.data(1).logicalSrcIdx = 41;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(15) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% jop1zgxqc0r.kebbqx0wqlt.esucolvee4
	  section.data(1).logicalSrcIdx = 42;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(16) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% jop1zgxqc0r.kebbqx0wqlt.mc3nremms5
	  section.data(1).logicalSrcIdx = 43;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(17) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% jop1zgxqc0r.kebbqx0wqlt.mjrqd5o5ix
	  section.data(1).logicalSrcIdx = 44;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(18) = section;
      clear section
      
      section.nData     = 5;
      section.data(5)  = dumData; %prealloc
      
	  ;% jop1zgxqc0r.mlte12umj5s.mt3f54u3mo
	  section.data(1).logicalSrcIdx = 45;
	  section.data(1).dtTransOffset = 0;
	
	  ;% jop1zgxqc0r.mlte12umj5s.lzcsdjjoxl
	  section.data(2).logicalSrcIdx = 46;
	  section.data(2).dtTransOffset = 1;
	
	  ;% jop1zgxqc0r.mlte12umj5s.cc04tmhhsh
	  section.data(3).logicalSrcIdx = 47;
	  section.data(3).dtTransOffset = 2;
	
	  ;% jop1zgxqc0r.mlte12umj5s.pwmpotfgge
	  section.data(4).logicalSrcIdx = 48;
	  section.data(4).dtTransOffset = 3;
	
	  ;% jop1zgxqc0r.mlte12umj5s.azarxy1ezw
	  section.data(5).logicalSrcIdx = 49;
	  section.data(5).dtTransOffset = 4;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(19) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% jop1zgxqc0r.mlte12umj5s.gafewsixto
	  section.data(1).logicalSrcIdx = 50;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(20) = section;
      clear section
      
      section.nData     = 6;
      section.data(6)  = dumData; %prealloc
      
	  ;% jop1zgxqc0r.mlte12umj5s.lnoibhcisc
	  section.data(1).logicalSrcIdx = 51;
	  section.data(1).dtTransOffset = 0;
	
	  ;% jop1zgxqc0r.mlte12umj5s.g01xrz5s1v
	  section.data(2).logicalSrcIdx = 52;
	  section.data(2).dtTransOffset = 1;
	
	  ;% jop1zgxqc0r.mlte12umj5s.gyhnbd1o5d
	  section.data(3).logicalSrcIdx = 53;
	  section.data(3).dtTransOffset = 2;
	
	  ;% jop1zgxqc0r.mlte12umj5s.mijgo3m0fz
	  section.data(4).logicalSrcIdx = 54;
	  section.data(4).dtTransOffset = 3;
	
	  ;% jop1zgxqc0r.mlte12umj5s.b0ja5ky2k3
	  section.data(5).logicalSrcIdx = 55;
	  section.data(5).dtTransOffset = 4;
	
	  ;% jop1zgxqc0r.mlte12umj5s.feexnv01zp
	  section.data(6).logicalSrcIdx = 56;
	  section.data(6).dtTransOffset = 5;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(21) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (dwork)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    dworkMap.nTotData = nTotData;
    


  ;%
  ;% Add individual maps to base struct.
  ;%

  targMap.paramMap  = paramMap;    
  targMap.signalMap = sigMap;
  targMap.dworkMap  = dworkMap;
  
  ;%
  ;% Add checksums to base struct.
  ;%


  targMap.checksum0 = 272904941;
  targMap.checksum1 = 1743092559;
  targMap.checksum2 = 3866937292;
  targMap.checksum3 = 1038571906;

