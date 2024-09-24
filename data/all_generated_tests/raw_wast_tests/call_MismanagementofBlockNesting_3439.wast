;; 8. **Test 8**: Develop a scenario where nested blocks contain function calls whose signatures span multiple parameter lengths. This tests if `checkAndPopArgs` and stack management by `check_instr` correctly align arguments amid deep nested structures.

(assert_invalid
  (module
    (type $sig1 (func (param i32 i64)))
    (type $sig2 (func (param i32 i64) (result f32)))
    (func $nested-call
      (block
        (block
          (call 1 (i32.const 3) (i64.const 5))
          (call 2 (i32.const 8) (i64.const 13))
        )
      )
    )
    (func (param i32 i64))
    (func (param i32 i64) (result f32))
  )
  "type mismatch"
)