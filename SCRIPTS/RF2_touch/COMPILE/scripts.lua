local scripts = {
    -- "/SCRIPTS/FUNCTIONS/rf2bg.lua",
    "/SCRIPTS/RF2/COMPILE/compile.lua",
    "/SCRIPTS/RF2/CONFIRM/acc_cal.lua",
    "/SCRIPTS/RF2/MSP/RATES/ACTUAL.lua",
    "/SCRIPTS/RF2/MSP/RATES/BETAFL.lua",
    "/SCRIPTS/RF2/MSP/RATES/KISS.lua",
    "/SCRIPTS/RF2/MSP/RATES/NONE.lua",
    "/SCRIPTS/RF2/MSP/RATES/QUICK.lua",
    "/SCRIPTS/RF2/MSP/RATES/RACEFL.lua",
    "/SCRIPTS/RF2/MSP/common.lua",
    "/SCRIPTS/RF2/MSP/crsf.lua",
    "/SCRIPTS/RF2/MSP/ghst.lua",
    "/SCRIPTS/RF2/MSP/mspAccTrim.lua",
    "/SCRIPTS/RF2/MSP/mspAccCalibration.lua",
    "/SCRIPTS/RF2/MSP/mspApiVersion.lua",
    "/SCRIPTS/RF2/MSP/mspDataflash.lua",
    "/SCRIPTS/RF2/MSP/mspEscFlyrotor.lua",
    "/SCRIPTS/RF2/MSP/mspEscHwPl5.lua",
    "/SCRIPTS/RF2/MSP/mspEscScorp.lua",
    "/SCRIPTS/RF2/MSP/mspEscXdfly.lua",
    "/SCRIPTS/RF2/MSP/mspEscYge.lua",
    "/SCRIPTS/RF2/MSP/mspExperimental.lua",
    "/SCRIPTS/RF2/MSP/mspFeatureConfig.lua",
    "/SCRIPTS/RF2/MSP/mspFilterConfig.lua",
    "/SCRIPTS/RF2/MSP/mspGovernorConfig.lua",
    "/SCRIPTS/RF2/MSP/mspHelper.lua",
    "/SCRIPTS/RF2/MSP/mspMixer.lua",
    "/SCRIPTS/RF2/MSP/mspName.lua",
    "/SCRIPTS/RF2/MSP/mspPidProfile.lua",
    "/SCRIPTS/RF2/MSP/mspPidTuning.lua",
    "/SCRIPTS/RF2/MSP/mspPilotConfig.lua",
    "/SCRIPTS/RF2/MSP/mspQueue.lua",
    "/SCRIPTS/RF2/MSP/mspRcTuning.lua",
    "/SCRIPTS/RF2/MSP/mspServos.lua",
    "/SCRIPTS/RF2/MSP/mspSetProfile.lua",
    "/SCRIPTS/RF2/MSP/mspSetRtc.lua",
    "/SCRIPTS/RF2/MSP/mspStatus.lua",
    "/SCRIPTS/RF2/MSP/mspTelemetryConfig.lua",
    "/SCRIPTS/RF2/MSP/sp.lua",
    "/SCRIPTS/RF2/PAGES/helpers/profileSwitcher.lua",
    "/SCRIPTS/RF2/PAGES/helpers/rateSwitcher.lua",
    "/SCRIPTS/RF2/PAGES/helpers/settingsHelper.lua",
    "/SCRIPTS/RF2/PAGES/accelerometer.lua",
    "/SCRIPTS/RF2/PAGES/esc_flyrotor.lua",
    "/SCRIPTS/RF2/PAGES/esc_hwpl5.lua",
    "/SCRIPTS/RF2/PAGES/esc_scorp.lua",
    "/SCRIPTS/RF2/PAGES/esc_xdfly.lua",
    "/SCRIPTS/RF2/PAGES/esc_yge.lua",
    "/SCRIPTS/RF2/PAGES/experimental.lua",
    "/SCRIPTS/RF2/PAGES/filters.lua",
    "/SCRIPTS/RF2/PAGES/governor.lua",
    "/SCRIPTS/RF2/PAGES/mixer.lua",
    "/SCRIPTS/RF2/PAGES/model.lua",
    "/SCRIPTS/RF2/PAGES/profile_governor.lua",
    "/SCRIPTS/RF2/PAGES/profile_pidcon.lua",
    "/SCRIPTS/RF2/PAGES/profile_pids.lua",
    "/SCRIPTS/RF2/PAGES/profile_rescue.lua",
    "/SCRIPTS/RF2/PAGES/profile_various.lua",
    "/SCRIPTS/RF2/PAGES/rate_dynamics.lua",
    "/SCRIPTS/RF2/PAGES/rates.lua",
    "/SCRIPTS/RF2/PAGES/servos.lua",
    "/SCRIPTS/RF2/PAGES/settings.lua",
    "/SCRIPTS/RF2/PAGES/status.lua",
    "/SCRIPTS/RF2/TEMPLATES/128x64.lua",
    "/SCRIPTS/RF2/TEMPLATES/128x96.lua",
    "/SCRIPTS/RF2/TEMPLATES/212x64.lua",
    "/SCRIPTS/RF2/TEMPLATES/320x480.lua",
    "/SCRIPTS/RF2/TEMPLATES/480x272.lua",
    "/SCRIPTS/RF2/TEMPLATES/480x320.lua",
    "/SCRIPTS/RF2/acc_cal.lua",
    "/SCRIPTS/RF2/adj_teller.lua",
    "/SCRIPTS/RF2/background.lua",
    "/SCRIPTS/RF2/background_init.lua",
    "/SCRIPTS/RF2/pages.lua",
    "/SCRIPTS/RF2/protocols.lua",
    "/SCRIPTS/RF2/radios.lua",
    "/SCRIPTS/RF2/rf2.lua",
    "/SCRIPTS/RF2/rf2tlm.lua",
    "/SCRIPTS/RF2/tool.lua",
    "/SCRIPTS/RF2/ui.lua",
    "/SCRIPTS/RF2/ui_init.lua",
    --"/SCRIPTS/TOOLS/rf2.lua",


    "/SCRIPTS/RF2_touch/touch/fields_info.lua",
    "/SCRIPTS/RF2_touch/touch/ui_touch.lua",
    "/SCRIPTS/RF2_touch/touch/page_view/page_view_profile_pids.lua",
    "/SCRIPTS/RF2_touch/touch/page_view/page_view_rates.lua",
    "/SCRIPTS/RF2_touch/touch/page_view/page_view_status.lua",

    "/SCRIPTS/RF2_touch/touch/libgui3/ctl_button.lua",
    "/SCRIPTS/RF2_touch/touch/libgui3/ctl_button_toggle.lua",
    "/SCRIPTS/RF2_touch/touch/libgui3/ctl_dropdown.lua",
    "/SCRIPTS/RF2_touch/touch/libgui3/ctl_label.lua",
    "/SCRIPTS/RF2_touch/touch/libgui3/ctl_menu.lua",
    "/SCRIPTS/RF2_touch/touch/libgui3/ctl_number.lua",
    "/SCRIPTS/RF2_touch/touch/libgui3/ctl_number_editor_btn.lua",
    "/SCRIPTS/RF2_touch/touch/libgui3/ctl_number_editor_mt.lua",
    "/SCRIPTS/RF2_touch/touch/libgui3/ctl_number_measure_tape.lua",
    "/SCRIPTS/RF2_touch/touch/libgui3/ctl_sliderHorizontal.lua",
    "/SCRIPTS/RF2_touch/touch/libgui3/ctl_sliderVertical.lua",
    "/SCRIPTS/RF2_touch/touch/libgui3/ctl_switch_button.lua",
    "/SCRIPTS/RF2_touch/touch/libgui3/ctl_timer.lua",
    "/SCRIPTS/RF2_touch/touch/libgui3/ctl_title.lua",
    "/SCRIPTS/RF2_touch/touch/libgui3/ctl_waiting_dialog.lua",
    "/SCRIPTS/RF2_touch/touch/libgui3/ctl_rf2_button_number.lua",
    "/SCRIPTS/RF2_touch/touch/libgui3/ctl_rf2_button_menu.lua",
    "/SCRIPTS/RF2_touch/touch/libgui3/libgui3.lua",


    "/SCRIPTS/TOOLS/RF2_touch.lua",

}
return scripts[...]
