;; 8. **Test Unreachable in Complex Nesting:**    - Use `unreachable` inside nested `block` and `loop` statements with interleaved conditional checks. Ensure the presence of other traps does not interfere with CFG understanding.    - **Constraint Checked:** Proper handling of `unreachable` in complex nested constructs.    - **CFG Relation:** Faulty CFG might mishandle the nesting, causing inadvertent execution of nested segments that should trap.

(assert_invalid
  (module (func $test_unreachable_in_complex_nesting
    (block
      (loop 
        (if (i32.const 1)
          (then 
            (block 
              (unreachable)
              (i32.const 2)
            ))
        )
        (br 0)
      )
    )
  ))
  "type mismatch"
)