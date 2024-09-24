;; 10. **Test Description:** Construct a complex nested hierarchy involving `block`, `if`, and `loop` constructs with a mixed series of `br` instructions targeting each layer's exit. This comprehensive test challenges the CFG’s consistency in managing deeply nested and conditionally branched labels, especially under wizard_engine’s label argument inconsistency.  These tests are designed to probe specific areas where the control flow might break down due to mishandled label arguments or incorrect branching, particularly focusing on deep nesting, complex conditional structures, and mixed forward/backward branching scenarios.

(assert_invalid 
  (module 
    (func $complex-nesting (result i32)
      (block $outer (result i32)
        (loop $middle (result i32)
          (block $inner (result i32)
            (if (i32.const 1)
              (then 
                (br $outer)
                (i32.const 5)
              )
              (else 
                (br $middle)
              )
            )
            (i32.const 3)
          )
        )
      )
    )
  )
  "type mismatch"
)