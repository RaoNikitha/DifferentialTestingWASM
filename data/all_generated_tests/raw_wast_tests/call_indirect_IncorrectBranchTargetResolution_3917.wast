;; 6. Develop a WebAssembly module with deeply nested function calls, where an indirect call within a nested block combined with `br` results in an incorrect target resolution due to function signature mismatch, causing the flow to skip critical sections.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem $nested_call))
    (func $nested_call (param i32) (result i32)
      (i32.add (local.get 0) (i32.const 1))
    )
    (func (result i32)
      (block
        (block
          (call_indirect (type $sig) (i32.const 0) (i32.const 0))
          (br 1)
        )
        (call_indirect (type $sig) (i32.const 1) (i32.const 1))
      )
    )
  )
  "type mismatch"
)