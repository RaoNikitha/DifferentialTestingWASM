;; 1. **Test with Out-of-Bounds Function Index**:    - **Description**: Invoke a `call` instruction with a function index that is out-of-bounds.    - **Constraint**: This test checks for proper bounds checking when resolving a function index.    - **Relation to Incorrect Branch Target Resolution**: If the implementation fails to error correctly, it could result in branching to an unintended function or memory area.

(assert_invalid
  (module
    (func (param i32))
    (func (param i32))
    (func (call 3))
  )
  "unknown function"
)