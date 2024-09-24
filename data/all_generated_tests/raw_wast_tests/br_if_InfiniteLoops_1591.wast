;; 2. Test an infinite loop with nested `br_if` conditions checking for positive integers. Ensure each nested loop checks complex stack conditions. The WASM implementation might exit correctly, but a mismanaged side-table in `wizard_engine` could result in an infinite loop.

(assert_invalid
  (module
    (func $nested-br_if-loop
      (block
        (loop
          (br_if 1 (i32.const 0))
          (loop
            (br_if 1 (i32.const 1))
            (br_if 1 (i32.const 0))
          )
        )
      )
    )
  )
  "type mismatch"
)