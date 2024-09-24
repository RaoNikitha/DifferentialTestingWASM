;; 4. **Test for Correct Label Scope Handling**:    - Test if nesting an `if` instruction within another control flow structure (`block` or `loop`) which then calls an imported function handles labels correctly, ensuring no misalignment in label scope due to the cross-boundary call.    - **Constraint Focus**: Ensures labels within nested structures remain consistent across module calls.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func))
    (func $nested_if_label_scope
      (block
        (if (i32.const 1)
          (then
            (i32.const 1) (call $external_func) (br 0)
          )
          (else
            (i32.const 1) (br 0)
          )
        )
      )
    )
  )
  "type mismatch"
)