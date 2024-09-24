;; Design a block having nested blocks with unlabeled `end` and `loop` instructions. Use a `br` instruction inside a nested block to target the top-level block. The test should check correct label target resolution while managing unlabeled structured control instructions.

(assert_invalid
  (module (func
    (block (result i32)
      (block
        (loop
          (br 2 (i32.const 42))
          (br 1)
          end
        )
        (i32.const 1)
        end
      )
      (i32.const 1)
    )
  ))
  "type mismatch"
)