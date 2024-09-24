;; 8. Create a function with multiple levels of blocks where `call_indirect` is executed in the innermost block and `br` jumps back multiple levels incorrectly. This should lead to an invalid table index for the indirect call.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func)
    (func $func (param i32) (result i32) (i32.add (local.get 0) (i32.const 1)))
    (func $test
      (block $outer
        (block $inner
          (br $outer)
          (call_indirect (type $sig) (i32.const 1) (i32.const 0))
        )
      )
    )
  )
  "invalid table index"
)