'===============================================================================
'Save this as .VBS file and use Run as Administrator

'Set oParams.uFlags = 0 for making the next policy request will be for a full policy instead of the change in policy since the last policy request.

'Set oParams.uFlags = 1 The existing policy will be purged completely.

'===============================================================================

set oCCMNamespace = GetObject("winmgmts:root\ccm")

set oInstance = oCCMNamespace.Get("SMS_Client")

set oParams = oInstance.Methods_("ResetPolicy").inParameters.SpawnInstance_()

oParams.uFlags = 1

oCCMNamespace.ExecMethod "SMS_Client","ResetPolicy",oParams

'===============================================================================