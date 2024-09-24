;; 7. **Loops with Early Exit and `nop`**:    Use loops that have conditions for early exit (`br_if`), inserting `nop` within loop iterations. Ensure the loop's exit conditions are correctly evaluated and not disrupted by `nop`.

(assert_invalid
  (module (func $loop-early-exit
    (block $exit
      (loop $loop
        nop
        br_if $exit (i32.const 0)
      )
    )
  ))
  "unreachable code"
)