;; 10. Test Description: Develop a module that features multiple nested function calls with `br` instructions that reference these nested blocks. Ensure various stack depths and operand types are properly tested for consistency and corruption, focusing on differential stack management in `wizard_engine`.

(assert_invalid
  (module
    (func $nested-br (param i32 i64) (result i32)
      (block (result i32)
        (block (result i32 i64)
          (br 1 (i32.const 0) (i64.const 0))
          (drop)
        )
        (br 1 (i32.const 1)) 
      )
      (i32.const 2)
    )
  )
  "type mismatch"
)