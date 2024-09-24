;; 7. Test an `if` with a `br_table` instruction in a nested block to observe whether the control flow and correct jump are maintained under varying indices. ```wasm (block   (if (i32.const 1)     (then       (block         (br_table 0 1 (i32.const 0))       )     )   ) ) ```

(assert_invalid
  (module
    (func $test
      (block
        (if (i32.const 1)
          (then
            (block
              (br_table 0 1 (i32.const 0))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)