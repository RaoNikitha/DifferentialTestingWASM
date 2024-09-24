;; 8. Use `br` to repeatedly exit out of closely nested `loop` and `block` constructs ensuring the stack respects the operand types consumed and restored properly. Observing incorrect stack states reveals mismanaged operand stack manipulations in repetitive branch targets.

(assert_invalid
  (module
    (func $test-br-nested
      (block $outer
        (loop $inner
          (br $outer)
        )
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)