# Equations

Equations is macOS package that provides a friendly API for programmatically generate constraints

## Usage

**Equations** provides an equation-style for constraint generation

```swift
let parentView = NSView()
let view = NSView()

parentView.addSubview(view)
view.translatesAutoresizingMaskIntoConstraints = false

// Here starts Equations usage
view.equations {
    $0.top == parentView.topAnchor + 2
    $0.width == 2 * parentView.widthAnchor + 5
}
```

In the previous example, the constraints are activated when the `equations` closure is executed. It is also important to be able to manage the priorities of the constraints:

```swift
view.equations {
    $0.top.with(priority: 600) == parentView.topAnchor + 2
    $0.width == 2 * parentView.widthAnchor + 5
}
```

Sometimes, we need to create constraints that should not be activated immediately:

```swift
let nonActiveConsrtaint = view.equateConstraint { 
    return $0.top.with(priority: 600) == parentView.topAnchor + 2 
}
```

Equations forces to logically group related constraints, which leads to much cleaner code.
