;; 2. **Out-of-Bounds Table Index Leading to Unreachable**:    - Test where the `call_indirect` uses an index out of the table bounds, ensuring that this triggers an immediate trap and hits the `unreachable` instruction.    - Validates the boundary check mechanisms and ensures accurate trapping before proceeding to unreachable paths.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (param i32) (result i32) (local.get 0))
    (func $test
      (call_indirect (type $sig) (i32.const 2) (i32.const 42))
    )
  )
  "out of bounds table index"
)