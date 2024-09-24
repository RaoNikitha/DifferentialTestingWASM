;; 1. **Test misinterpretation of nested block depth with `nop`:** Create a function with deeply nested blocks where `nop` is present at multiple nesting levels. Use `br_table` to jump out of specific blocks. This test checks if the `resetSig` method improperly resets contexts, leading to incorrect jumping logic.

(assert_invalid
  (module
    (func $nested-nop
      (block
        (loop
          (block
            (nop)
            (block
              (br_table 0 1 2 
                (i32.const 0)))))
          (nop)))))
  "invalid block type")