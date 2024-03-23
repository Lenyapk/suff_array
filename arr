vc<ll> a(n), c(n), h(n);
    vc<pair<char, int>> p(n);
    for (int i = 0; i < n; ++i) p[i] = { s[i], i };
    sort(its(p));
    int cc = -1;
    for (int i = 0; i < n; ++i) {
        a[i] = p[i].second;
        if (i == 0 or p[i].first != p[i - 1].first) h[++cc] = i;
        c[a[i]] = cc;
    }
    ll l = 1;
    vc<ll> a1(n), c1(n);
    while (l < n) {
        for (int i = 0; i < n; ++i) {
            int j = (a[i] - l + n) % n;
            a1[h[c[j]]++] = j;
        }
        cc = -1;
        //h.assign(n, 0);
        for (int i = 0; i < n; ++i) {
            if (i == 0 or mkt(c[a1[i]], c[(a1[i] + l) % n]) != mkt(c[a1[i - 1]], c[(a1[i - 1] + l) % n])) {
                h[++cc] = i;
            }
            c1[a1[i]] = cc;
        }
        a = a1, c = c1, l *= 2;
    }
    vc<ll> lcp(n);
    int z = 0;
    for (int i = 0; i < n; ++i) {
        int j = c[i];
        if (j == n - 1) continue;
        while (s[a[j] + z] == s[a[j + 1] + z]) ++z;
        lcp[j] = z;
        if (z > 0) --z;
    }
