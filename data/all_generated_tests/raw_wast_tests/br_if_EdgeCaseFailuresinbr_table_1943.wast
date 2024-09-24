;; 4. **Test Description**: Embed a `br_if` in a block sequence within a `loop` such that the `br_if` conditionally breaks to the loop’s start. Use `br_table` to index targets ambiguously related to the loop. Validate if `wizard_engine` correctly resolves label arguments, while WASM misinterprets targets.

(assert_invalid
  (module
    (func $test_br_if_in_loop
      (block
        (loop
          (block
            (br_if 1 (i32.const 1)) 
            (br_table 0 1 2 (i32.const 0)) 
          )
        )
      )
    )
  )
  "unknown label"
)