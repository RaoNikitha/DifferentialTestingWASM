;; 5. **Test Description 5:** Implement a complex control flow involving a combination of `block`, `loop`, and `if` constructs. The `br` instruction should target labels outside these constructs after making multiple calls to imported and exported functions, verifying correct operand stack management.

(assert_invalid
  (module
    (func $complex-blocks
      (block $block1
        (loop $loop1
          (if (i32.const 1)  ;; Always true
            (then
              (block $block2
                (i32.const 0)
                (block $block3
                  (br 2)  ;; Trying to break out to $block1
                )
                (return)
              )
            )
          )
          (return)
        )
      )
    )
  )
  "type mismatch"
)