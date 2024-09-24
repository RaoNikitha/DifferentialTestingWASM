;; Test 10: Write a compound block with multiple layers of loops and conditional breaks, with the outermost block type requiring an `i32`. The loops should break based on combined stack conditions verified through `br_if`. Check if WebAssembly handles all conditional breaks appropriately, ensuring termination, while `wizard_engine` might maintain incorrect loop registers and continue indefinitely.

(assert_invalid
  (module (func $compound-block
    (block (result i32)
      (loop (result i32)
        (block (result i32)
          (loop (result i32)
            (block (result i32)
              (f32.const 0.0)
              (br_if 0 (i32.eqz (i32.const 1)))
              (br 1)
            )
            (br_if 1 (i32.eqz (i32.const 0)))
          )
        )
      )
      (i32.const 1)
    )
  ))
  "type mismatch"
)