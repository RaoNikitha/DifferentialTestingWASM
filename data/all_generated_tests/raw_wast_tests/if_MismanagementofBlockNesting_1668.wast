;; 9. Test an `if` with nested `loop` and an inner `if-else` where the `else` block contains a `br` to exit to the outer loop. Verify correct nesting and label management. ```wasm (loop   (if (i32.const 1)     (then        (block         (if            (i32.const 0)           (then (unreachable))           (else (br 1))         )       )     )   ) ) ```

(assert_invalid
  (module
    (func
      (loop
        (if (i32.const 1)
          (then
            (block
              (if (i32.const 0)
                (then (unreachable))
                (else (br 1))
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)