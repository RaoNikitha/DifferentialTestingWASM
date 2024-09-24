;; 3. **Test with `nop` Within Nested Blocks and Conditional `br_if`**: Place a `nop` inside nested blocks followed by a `br_if` in the innermost block that evaluates based on a parameter. Misinterpretation of `nop` should not affect the branch decision.

(assert_invalid
  (module
    (func $nested_blocks (param $cond i32)
      block
        block
          nop
          br_if 0 (local.get $cond)
        end
        nop
      end
    )
  )
  "type mismatch"
)