;; - **Test 8**: Compose an alternating sequence of `br` and `br_if` instructions within nested blocks. Insert `unreachable` instructions selectively post `br_if`. This checks if reaching or skipping blocks bypasses unintended control paths leading to `unreachable`.

(assert_invalid
 (module
  (func $nested-br-and-br_if
   (block
    (block
     (i32.const 1)
     (br_if 1 (i32.const 1))
     (unreachable)
    )
    (unreachable)
    (block
     (i32.const 0)
     (br 1)
     (br_if 0 (i32.const 1))
     (unreachable)
    )
   )
  )
 )
 "unreachable executed"
)