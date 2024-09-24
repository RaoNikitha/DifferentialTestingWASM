;; 9. Place an `unreachable` instruction inside a block that also contains a `br_table` to several possible outer labels. Make certain the `unreachable` instruction traps and prevents incorrect branch target resolution by misinterpreting `br_table` labels.

(assert_invalid
  (module (func $type-unreachable-br_table (result i32)
    (block (result i32)
      (block (unreachable) (br_table 0 0 (i32.const 1)))
    )
  ))
  "type mismatch"
)