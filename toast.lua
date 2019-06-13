local toast = nil
local toastFont = native.systemFont
local toastFontSize = 14
local duration, objX, objY

function showToast(label, options)
  local function removeToast()
    if toast ~= nil then
      if toast.label ~= nil then
        toast.label:removeSelf()
        toast.label = nil
      end

      toast:removeSelf()
      toast = nil
    end
  end

  removeToast()

  if options ~= nil then
    if options.duration == "short" then
      duration = 1500
    elseif options.duration == "normal" then
      duration = 3000
    elseif options.duration == "long" then
      duration = 5000
    end

    if options.gravity == "center" then
      objX = display.contentCenterX
      objY = display.contentCenterY
    elseif options.gravity == "top" then
      objX = display.contentCenterX
      objY = 36
    elseif options.gravity == "bottom" then
      objX = display.contentCenterX
      objY = display.viewableContentHeight - 36
    end
  else
     duration = 3000
     objX = display.contentCenterX
     objY = display.contentCenterY
  end

  toast = display.newRoundedRect(objX, objY, 32, 32, 32)
  toast:setFillColor(0.5)
  toast.alpha = 0.75
  toast.label = display.newText(label, objX, objY, toastFont, toastFontSize)
  toast.width = toast.label.contentWidth + 32
  toast.height = toast.label.contentHeight + 10

  timer.performWithDelay(duration, removeToast)

  return true
end
