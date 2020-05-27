#include <iostream>
#include <vector>
#include <string>

#define ll long long

using namespace std;

int main()
{
    ll n, s, q, e;
    cin >> n >> s >> q >> e;

    vector<ll> w(n - 1);
    for (ll i = 0; i < n - 1; i++)
    {
        ll u, v, w1;
        cin >> u >> v >> w1;
        w[u] = w1;
    }

    vector<ll> sup(s);
    for (ll i = 0; i < s; i++)
    {
        cin >> sup[i];
    }

    for (ll i = 0; i < q; i++)
    {
        ll I, R;
        cin >> I >> R;
        if (I < min(e, R) || I > max(e, R))
        {
            cout << "escaped" << endl;
        }
        else
        {
            ll dis = 1000000001;
            for (ll j = 0; j < s; j++)
            {
                if (I < min(sup[i], R) || I > max(sup[i], R))
                {
                    ll sum = 0;
                    for (ll k = min(sup[i], R); k < max(sup[i], R); k++)
                    {
                        sum += w[k];
                    }
                    dis = min(dis, sum);
                }
            }

            if (dis == 1000000001)
            {
                cout << "oo" << endl;
            }
            else
            {
                cout << dis << endl;
            }
        }
        
    }

}