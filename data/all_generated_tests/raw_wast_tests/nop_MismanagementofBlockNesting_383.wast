;; 4. **Combining `block`, `loop`, and `if` with `nop`:** Develop a test combining various control structures (blocks, loops, if-statements) with `nop` inside them. Exercise `br`, `br_if`, and `br_table` instructions to test the correct nesting levels are respected, ensuring `nop` operation does not interfere with control flow accuracy.

(assert_invalid
  (module
    (func
      (block
        (loop
          (if (i32.const 1)
            (then
              (nop)
              (br 1)
            )
          )
          (br 0)
        )
      )
    )
  )
  "type mismatch"
)