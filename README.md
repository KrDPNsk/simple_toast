# simple_toast
Simple example for Toast Notification without any plugins for Corona SDK.

How to use?

• Add toast.lua in your Corona project root directory
• Add string 'require "toast"' in main.lua
• For call toast notification, use next code:

  showToast(text[, {duration = dur, gravity = grav}])
  
  where:
    text - your text for notification
    dur - "short" (1500 ms), "normal" (3000 ms), "long" (5000 ms)
    grav - "top", "center", "bottom"
    
For example:

  require "toast"
  
  -- Your code
  
  showToast("Hello!", {duration = "long", gravity = "bottom"})
  
  -- or wihtout options (then duration = "normal" and gravity = "center"): 
  
  showToast("Hello!")
