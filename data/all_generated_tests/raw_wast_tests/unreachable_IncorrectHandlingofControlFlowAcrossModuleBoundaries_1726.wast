;; 7. Develop a WebAssembly module (`Module A`) exporting a conditional branch that ends in `unreachable` for one path. Import and invoke this function from another module (`Module B`). Check if `Module B` handles control flow correctly, ensuring trapping occurs immediately when reaching the `unreachable` instruction without further instructions executing.

(assert_invalid 
  (module
    (func $type-br_if-after-unreachable (result i64)
      unreachable
      br_if 0
      i64.extend_i32_u
    )
  )
 "type mismatch"
)