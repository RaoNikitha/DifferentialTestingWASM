;; 2. **Test Description:**    A scenario where `call_indirect` is used inside a loop and the indirect call table has mismatched function types. This examines the robustness of type checking in function calls within loops.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (param i32) (result i32)
      (loop $l
        (block
          (br_if 0 (i32.eqz (local.get 0)))
          (call_indirect (type $sig) (i32.const 0) (local.get 0))
        )
      )
    )
  )
  "type mismatch"
)