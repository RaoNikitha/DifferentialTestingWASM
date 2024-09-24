;; 5. Test module export functions ending with loops having `br` instructions to inner blocks, ensuring that the loop reinitialization correctly resets operand states across module boundaries.

(assert_invalid
  (module
    (func $exported_func (export "exported_func") (result i32)
      (block $outer_block
        (block $inner_block
          (loop $loop_body
            (br $inner_block) 
            (i32.const 1)
          )
        )
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)