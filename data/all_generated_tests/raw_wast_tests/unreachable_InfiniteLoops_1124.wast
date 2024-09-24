;; 5. Create a loop with multiple `br_if` instructions based on various complex conditions, one of which contains an `unreachable` instruction. The test checks if reaching the `unreachable` correctly results in a trap, rather than an infinite loop. This ensures `unreachable` invalidates all subsequent operations within the loop.

(assert_invalid
  (module
    (func $test (result i32)
      (block
        (loop
          (br_if 1 (i32.const 0))
          (br_if 0 (i32.const 1))
          (unreachable)
          (i32.const 42)
        )
      )
    )
  )
  "type mismatch"
)