;; 1. **Test Description**:     - **Setup**: Define a function `A` that performs an indirect function call to a non-existent function index.    - **Constraint**: The index should trigger an `unreachable` instruction due to being out-of-bounds.    - **Reasoning**: Checks how each engine handles function index bounds and triggers unreachable code.

(assert_invalid
  (module
    (func $A 
      (call_indirect (type $sig) (i32.const 999999999))
    )
    (type $sig (func))
    (table funcref)
  )
  "unknown element"
)