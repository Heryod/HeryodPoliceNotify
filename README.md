# Fivem Police Notify Script

## Simple export:

```
exports['HeryodPoliceNotify']:SendToNUI('Title', 'content', 'code', { x, y, z }, isPriority(boolean), time(in second))
```

## Example:

```
exports['HeryodPoliceNotify']:SendToNUI('Robbery in progress', 'A report was received about a robbery at the Jewelery Showroom', '10-90', { x = -628.2906, y = -235.1198, z = 38.0571 }, true, 20)
```
