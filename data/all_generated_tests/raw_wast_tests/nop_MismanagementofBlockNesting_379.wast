;; 11. An intricate nested structure utilizing blocks, loops, and conditional branches with `nop` instructions placed to test that the function’s linear execution path remains unaffected and exits through the correct nested structures without mismanagement due to `nop`.

(assert_invalid
  (module
    (func $nested-blocks
      (block
        (loop
          (if (i32.const 1)
            (then
              (br 1)
            )
            (else
              (nop)
            )
          )
          (br 0)
        )
      )
    )
  )
  "type mismatch"
)