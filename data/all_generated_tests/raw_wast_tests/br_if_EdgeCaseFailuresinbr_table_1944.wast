;; 5. **Test Description**: Craft a deeply nested `loop` containing a `br_if` which targets another loop’s `block`. Use a `br_table` with a negative index generated dynamically. Check `wizard_engine` for proper index handling and label argument fetching which might differentiate from WASM's implicit behavior.

(assert_invalid
  (module
    (func $deep-nested-loop
      (loop $L1
        (loop $L2
          (block
            (br_if $L1 (i32.const 1))
            (br_table (i32.const -1) (br 2))
          )
        )
      )
    )
  )
  "unknown label"
)