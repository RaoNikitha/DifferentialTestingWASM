;; 9. **Test Description:** Develop a sequence with an outer and inner block, where the inner block makes multiple `call_indirect` instructions, and then uses `br` to target the outer block. Validate if the indirect calls complete and return as expected despite the branching.

(assert_invalid
  (module
    (func $indirect-calls-and-br
      (block $outer
        (block $inner
          (call_indirect (type $sig) (i32.const 0))
          (call_indirect (type $sig) (i32.const 1))
          (call_indirect (type $sig) (i32.const 2))
          (br $outer)
        )
      )
    )
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref)
  )
  "type mismatch"
)