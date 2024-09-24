;; 6. **Invalid Function Return Type Within Control Flow:**    - Test cases where a `call_indirect` function's return type does not conform to the expected type within a control flow instruction such as `block` or `loop`. Check that both implementations detect and handle the type error by trapping appropriately.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i32) (result f32)))
    (func $f (param i32) (result f32) (f32.const 0))
    (table funcref (elem $f))
    (func
      (block (result i32)
        (call_indirect (type 0) (i32.const 0))
      )
    )
  )
  "type mismatch"
)