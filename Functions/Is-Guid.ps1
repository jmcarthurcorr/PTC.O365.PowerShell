function Is-Guid()
{
  Param(
    [Parameter()]
    [String]
    $Value
  )
  
  $guid = [System.Guid]::Empty
  return [System.Guid]::TryParse($Value, [ref]$guid)
}