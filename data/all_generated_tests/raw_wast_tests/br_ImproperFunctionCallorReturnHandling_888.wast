;; 9. Function with deeply nested `br` instructions targeting labels at various levels, preceded by `call` instructions, aiming to detect if WebAssembly improperly handles the operand stack and function return values in comparison to wizard_engine.

(assert_invalid
  (module
    (func $deep-nested-br
      (block
        (block
          (block
            (call $dummy-func)
            (br 2)
          )
          (call $another-dummy-func)
          (br 1)
        )
        (call $yet-another-dummy-func)
        (br 0)
      )
    )
    (func $dummy-func)
    (func $another-dummy-func)
    (func $yet-another-dummy-func)
  )
  "type mismatch"
)