;; Construct deeply nested mixed blocks and loops, introducing conditional branches that target specific depths within these structures. WebAssembly should process the correct control flow, whereas Wizard Engine might display faulty behavior due to mismanaged contexts, leading to incorrect exits from nested structures.

(assert_invalid
  (module
    (func
      (block (result i32)
        (loop (result i32)
          (block (result i32)
            (br 2)
            (nop)
          )
        )
      )
    )
  )
  "type mismatch"
)